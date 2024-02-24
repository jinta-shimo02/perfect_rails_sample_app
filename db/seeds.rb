10.times do |n|
  Event.create(
    owner_id: 1,
    name: "event_name#{n}",
    place: "event_place#{n}",
    content: "event_content#{n}",
    start_at: DateTime.now + rand(1..30).days,
    end_at: DateTime.now + rand(31..60).days
  )
end