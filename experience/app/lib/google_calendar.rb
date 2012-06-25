require 'faraday'
require 'json'

class GoogleCalendar
  attr_accessor :client, :token, :user, :possible_time
  CALENDAR_URL = '/calendar/v3/freeBusy?fields=calendars&key=1010028708675.apps.googleusercontent.com'

  def initialize(user, possible_time)
    GoogleRefreshToken.new(user.google)
    @token = "Bearer #{user.google.token}"
    @user = user
    @user_email = user.email
    @possible_time = possible_time
  end

  def get_availability
    if get_availability["calendars"]["#{user.email}"]["busy"].size == 0
      user.possible_attendees.create(possible_time_id: possible_time.id)
    else 
      user.possible_attendees.where(possible_time_id: possible_time.id).delete_all
    end
  end

  def save_availability
    get_availability["calendars"]["#{user.email}"]["busy"].each do |appt|
      user.availabilities.create!(time_start: Time.parse(appt["start"]),
                                  time_end: Time.parse(appt["end"]))
    end
  end

  def client
    @client ||= Faraday.new(:url => 'https://www.googleapis.com') do |faraday|
                  faraday.request  :url_encoded
                  faraday.response :logger
                  faraday.adapter  Faraday.default_adapter
                end
  end

  def body
  {
    items: [
      {
        id: user.email
      }
    ],
      timeMin: possible_time.time_start.round.iso8601(3),
      timeMax: possible_time.time_end.round.iso8601(3)
  }
  end
end