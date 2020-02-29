module Card
  class CardComponent < ActionView::Component::Base
    attr_reader :title, :link_text, :image_url, :link_url, :styles

    validates :title, presence: true

    def initialize(title:, link_text: nil, image_url: nil, styles: nil, link_url: nil)
      @title = title
      @link_text = link_text
      @image_url = image_url
      @styles = styles
      @link_url = link_url
    end

    def image?
      image_url
    end

    def class_wrap
      styles.join(" ")
    end
  end
end
