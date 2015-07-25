class FileIO

  def encrypt_file

  handle = File.open(ARGV[0], "r")

  input = handle.read

  handle.close

  output = #PUT SOME STUFF HERE

  writer = File.open(ARGV[1], "w")

  writer.write(output)

  writer.close

  end


  def decrypt_file

  end

  def crack_file

  end

end
