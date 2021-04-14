class TopicsPresenter
  def initialize(topics)
    @topics = topics
  end

  def as_json
    topics.map do |topic|
      {
        id: topic.id,
        name: topic.name
      }
    end
  end

  private

  attr_reader :topics
end
