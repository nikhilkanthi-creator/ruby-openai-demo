# Write your solution here!
require "dotenv/load"
require "openai"
require "json"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

pp "Hi, this is Snoop Dogg's ChatGPT avatar! How can I help you today?"
puts "-" * 50


input = ""

while input != "bye"
  input = gets.chomp
  if input != "bye"
    message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant who talks like Snoop Dogg."
  },
  {
    "role" => "user",
    "content" => input
  }
  ]
  # Call the API to get the next message from GPT
  api_response = client.chat(
    parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
    }
    )
    response1 = api_response.fetch("choices")
response2 = response1.at(0)
response3 = response2.fetch("message")
response4 = response3.fetch("content")
pp response4.to_s
  end
  pp "if you want to end the chat, say bye"
end
puts "-" * 50
