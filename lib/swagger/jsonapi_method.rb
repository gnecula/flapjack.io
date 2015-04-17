class JsonapiMethod < ERB
  def initialize
    swagger_dir = File.dirname(__FILE__)
    template_path = File.join(swagger_dir, 'jsonapi_method.html.erb')
    super(File.read(template_path), nil, '-')
  end

  def result(options = {})
    b = binding
    [:title, :operation, :definitions].each do |v|
      b.local_variable_set(v, options[v])
    end
    super(b)
  end
end