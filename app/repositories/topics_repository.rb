class TopicsRepository
  def all
    Topic.all
  end

  def create(topic_params)
    topic = Topic.new(topic_params)
    topic.save!
  end

  def show(id)
    Topic.find(id)
  end

  def update(id, topic_params)
    topic = show(id)
    topic.update(topic_params)
  end

  def delete(id)
    Topic.destroy(id)
  end
end
