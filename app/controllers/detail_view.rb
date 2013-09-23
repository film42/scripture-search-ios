class DetailView < UIViewController
  def initWithScripture(scripture)
    @scripture = scripture
    init
  end

  def viewDidLoad
    self.title = @scripture.title
    self.view.backgroundColor = UIColor.whiteColor

    @text_view = UITextView.alloc.initWithFrame([[10, 10], [300, 470]])
    @text_view.editable = false
    @text_view.text = @scripture.text
    @text_view.font = UIFont.systemFontOfSize(22)
    self.view.addSubview(@text_view)
  end
end