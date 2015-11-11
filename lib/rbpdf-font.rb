module RBPDFFontDescriptor
  @@descriptors = { 'freesans' => {} }
  @@font_name = 'freesans'

  def self.font(font_name)
    @@descriptors[font_name.gsub(".rb", "")]
  end

  def self.define(font_name = 'freesans')
    @@descriptors[font_name] ||= {}
    yield @@descriptors[font_name]
  end

  #
  # Return fonts path
  #
  def self.getfontpath()
    # Is it in this plugin's font folder?
    fpath = File.join File.dirname(__FILE__), 'fonts'
    if File.exists?(fpath)
      return fpath
    end
    # Could not find it.
    nil
  end
end
