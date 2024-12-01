describe Parser, :ruby_2_x do
  VERSIONS_2_x.each do |version|
    
    it "HEREDOC", :ruby_2_x do
      ast = parse(<<~SQUIGGLY_HEREDOC, version)
        This would contain specially formatted text.
  
        That might span many lines
      SQUIGGLY_HEREDOC
    end

    it "should parse function with bare double star operator as argument", :ruby_2_3 do
      parse("def foo(**); end; foo({ :x => 2, :y => 3 })", 2.3)
    end
  end

  it "should parse the safe navigation operator", :ruby_2_3 do
    parse("if user&.admin?; end", 2.3)
  end
end
