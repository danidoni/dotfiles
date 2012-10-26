function! Gitcha()
ruby << EOF

class Gitcha
  def initialize
    @buffer = VIM::Buffer.current
    @buffer.append("Hi!")
  end
end

EOF
endfunction
