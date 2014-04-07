class MLRequest

  attr_reader :list, :email, :action

  ACTIONS = ['subscribe', 'unsubscribe']
  LISTS   = ['ruby-talk', 'ruby-core', 'ruby-doc', 'ruby-cvs']

  def initialize(params)
    @list = params[:list] || ''
    @email = params[:email] || ''
    @action = params[:action] || ''
  end

  def valid?
    !@email.strip.empty? &&
    LISTS.include?(@list) && ACTIONS.include?(@action)
  end

  def mail_options
    {
      :to   => "#{@list}-request@ruby-lang.org",
      :from => @email,
      :body => @action
    }
  end
end
