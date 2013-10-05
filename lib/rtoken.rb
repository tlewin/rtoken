# Generates Random Tokens for general purposes.
# 
# @example Generate 8 length token
#   RToken.rtoken #=> Random sequence 8 chars
#
# @example Generate 10 length token
#   RToken.rtoken(:size => 10) #=> Random sequence 10 chars
#   RTolen.rtoken(10) #=> Less verbose fashion
#
# @example Generate 16 length token with special chars
#   RToken.rtoken(:size => 16, :special_chars => '!@#$%%&')
#
# @example Generate 32 length token with uppercase chars
#   RToken.rtoken(:size => 32, :uppercase => true)
#
# @see RToken.rtoken
class RToken
  
  UPPER_ALPHA_CHARS   = ('A'..'Z').to_a.freeze
  LOWER_ALPHA_CHARS   = ('a'..'z').to_a.freeze

  NUMERIC_CHARS       = ('0'..'9').to_a.freeze

  DEFAULT_OPTIONS = {
    :size         => 8,
    :uppercase    => false,
    :lowercase    => false,
    :numeric      => true,
    :special_chars => ''
  }.freeze

  # Creates an instance of RToken and handle the options for later calls
  # It is useful when you have many settings and don't want to repeat them
  #
  # @example Generates tokens with special chars
  #   rtkn = RToken.new(:special_chars => '+-*/')
  #   # All next calls keeps the same options
  #   rtkn.rtoken #=> Same as Rtoken.rtoken(:special_chars => '+-*/')
  #
  # @param [Hash] opts same as rtoken
  def initialize(opts=nil)
    @options = opts || {}
  end
  
  # Generates a token with previews options
  # 
  # @see RToken.rtoken
  #
  # @param [Hash] opts options that will be merged to the predefined on initialize
  # @return [String] token
  def rtoken(opts=nil)
    opts = RToken.check_param(opts)
    RToken.rtoken @options.merge(opts || {})
  end
  
  # Less verbose way to call RToken.rtoken
  # @see RToken.rtoken
  def self.[](opts=nil)
    RToken.rtoken opts
  end
  
  # Generates a token
  #
  # @param [Integer] opts Sames as :size => n
  # @param [Hash] opts The options to configure the token generator
  # @param opts [Fixnum] :size The size of token string. Default 8
  # @param opts :uppercase if true all chars will be replaced by uppercase. Default false
  # @param opts :lowercase if true all chars will be replaced by lowercase. Has priority against :uppercase definition. Default false
  # @param opts :numeric if true include numeric chars ('0'..'9') on tokens. Default true
  # @param opts [String] :special_chars special chars to be include on token generation, by default include alphanumeric chars
  # @return [String] token
  def self.rtoken(opts=nil)
    opts = check_param(opts)
    options = DEFAULT_OPTIONS.merge(opts || {})
    size = options[:size] || 8
    # Merge available chars
    chars_array = options[:numeric] ? Array.new(NUMERIC_CHARS) : [] 
    if options[:uppercase] || options[:lowercase]
      chars_array += (options[:lowercase] ? LOWER_ALPHA_CHARS : UPPER_ALPHA_CHARS)
    else
      chars_array += LOWER_ALPHA_CHARS
      chars_array += UPPER_ALPHA_CHARS
    end
    chars_array += options[:special_chars].split('') if options[:special_chars]
    chars_array_size = chars_array.size
    # creates token
    token_chars = Array.new(size)
    size.times do |i|
      token_chars[i] = chars_array[rand(chars_array_size)]
    end
    token_chars.join
  end
  
  private 
  
  # @return If param is a Integer then convert it to {:size => param}
  def self.check_param(param)
    if param && param.is_a?(Integer)
      return {:size => param}
    end
    param
  end
end