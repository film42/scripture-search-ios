class SearchController < UITableViewController
  def viewDidLoad
    super

    self.title = 'Scripture Search'

    @scriptures = []

    self.tableView.dataSource = self
    self.tableView.delegate = self

    @search_bar = UISearchBar.alloc.initWithFrame([[0,0],[320,44]])
    @search_bar.placeholder = 'Search something...'
    @search_bar.delegate = self
    self.tableView.tableHeaderView = @search_bar
  end

  def search(query = '')
    BW::HTTP.get("http://scriptures.desh.es/search", payload: {query: query}) do |response|
      res = BW::JSON.parse(response.body.to_str)
      # Reset the Scripture List
      @scriptures = []
      res.each do |scripture|
        @scriptures.push(Scripture.new(scripture))
      end
      self.tableView.reloadData
    end
  end

  # Search Bar Delegates

  def searchBar(searchBar, textDidChange:searchText)
    search(searchText)
  end

  # Table Delegates

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @resueIdentifier ||= "CELL_IDENTIFER"

    cell = tableView.dequeueReusableCellWithIdentifier(@resueIdentifier) || begin
      ScriptureCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: @resueIdentifier)
    end
    scripture =  @scriptures[indexPath.row]
    cell.title.text = scripture.title
    cell.setText(scripture.text)
    cell
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @scriptures.size
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    detail_view = DetailView.alloc.initWithScripture(@scriptures[indexPath.row])

    tableView.deselectRowAtIndexPath(indexPath, animated:true)
    self.parentViewController.pushViewController(detail_view, animated:true)
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    scripture_cell = self.tableView(self.tableView, cellForRowAtIndexPath: indexPath)
    scripture_cell.getViewHeight
  end
end

