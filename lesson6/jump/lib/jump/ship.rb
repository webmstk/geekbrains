class Ship

  def jump &block
    if block_given?
      @coordinates = block.call.compute
      puts "Jumping to <<#{@coordinates}>>!"
    else
      raise 'error... the ship will be destroyed in 3..2..1'
    end
  end

end
