class ScriptureCell < UITableViewCell
  attr_accessor :title
  attr_accessor :text

  def initWithStyle(tablViewStyle, reuseIdentifier:reuseIdentifier)
    super

    @viewHeight = 200

    if self
      @title = UILabel.alloc.initWithFrame([[15, 4], [290, 16]])
      @title.font = UIFont.boldSystemFontOfSize(17)
      self.addSubview(@title)

      @text = UILabel.alloc.initWithFrame([[15, 22], [290, 42]])
      @text.numberOfLines = 2
      @text.textColor = UIColor.grayColor
      self.addSubview(@text)
    end
  end

  def setText(text)
    @text.text = text
  end

  # Return Dynamic Cell Height

  def getViewHeight
    title_height = 16
    text_height = @text.frame.size.height
    padding = 4 * 3
    title_height + text_height + padding
  end
end