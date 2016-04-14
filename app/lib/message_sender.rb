module MessageSender
  module_function

  def send(bike_id)
    msg = { 'bike_id' => bike_id, 'body' => generate_body }.to_json
    redis_connection.publish('bicycles', msg)
  end

  def redis_connection
    @redis_connection ||= Redis.new
  end

  def generate_body
    SecureRandom.base64(380)[0...500]
  end
end
