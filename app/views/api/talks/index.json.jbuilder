json.array! @talks do |talk|
  json.id      talk.id
  json.talk talk.talk
  json.date    talk.created_at.strftime("%Y/%m/%d %H:%M")
  json.speaker_name talk.speaker.name
  json.speaker_id talk.speaker_id
  json.user_id current_user.id
end