require 'date'

bookings = [{
  "checkin": "2017-10-1",
  "checkout": "2017-10-3",
  "id": 1
},
{
  "checkin": "2017-10-1",
  "checkout": "2017-10-4",
  "id": 2
},
{
  "checkin": "2017-10-3",
  "checkout": "2017-10-6",
  "id": 3
},
{
  "checkin": "2017-10-3",
  "checkout": "2017-10-8",
  "id": 4
},
{
  "checkin": "2017-10-4",
  "checkout": "2017-10-8",
  "id": 5
},
{
  "checkin": "2017-10-8",
  "checkout": "2017-10-12",
  "id": 6
},
{
  "checkin": "2017-10-9",
  "checkout": "2017-10-20",
  "id": 7
},
{
  "checkin": "2017-10-15",
  "checkout": "2017-10-20",
  "id": 8
},
{
  "checkin": "2017-10-21",
  "checkout": "2017-10-30",
  "id": 9
}]

num_of_rooms = 3

def get_dates(bookings)

    earliest_checkin = Date.parse(bookings.first[:checkin])
    latest_checkin = Date.parse(bookings.first[:checkin])

    bookings.each do |booking|
      checkin = Date.parse(booking[:checkin])
      # find the earliest checkin date
      if checkin < earliest_checkin
        earliest_checkin = checkin
      end

      # find the latest checkin date
      if checkin > latest_checkin
        latest_checkin = checkin
      end
    end

  return earliest_checkin, latest_checkin

end

def assign_rooms(bookings, num_of_rooms)
  # define an empty array for rooms
  rooms = []
  num_of_rooms.times do
    rooms.push([])
  end

  rooms.each do |room|

    earliest_checkin, latest_checkin = get_dates(bookings)

    date = earliest_checkin

    while date <= latest_checkin

      bookings.each do |booking|
        checkin = Date.parse(booking[:checkin])
        if checkin == date
          # put earliest booking id into array
          room.push(booking[:id])
          checkout = Date.parse(booking[:checkout])
          date = checkout
          # remove from array once assigned
          bookings.delete(booking)
        end
      end

      date += 1

    end

  end

  print rooms

end

result = assign_rooms(bookings, num_of_rooms)

#returns following
#[
#    [1,3,6,8,9],
#    [2,5,7],
#    [4]
#]