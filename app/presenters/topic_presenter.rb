class TopicPresenter
  def initialize(topic)
    @topic = topic
  end

  def as_json
    {
      id: topic.id,
      name: topic.name
    }
  end

  private

  attr_reader :topic
end
