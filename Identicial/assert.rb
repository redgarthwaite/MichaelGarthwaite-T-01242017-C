module Assert

  def self.compareHash(objectA, objectB, ignoredKeys, depthString='')
    messageError = ''
    objectA.each do |key,value|
      depthStringNew = depthString + "#{key}"
      if objectA[key].is_a?(Array) and !(ignoredKeys.include? key.to_s)
        messageError << compareArray(objectA[key],objectB[key],ignoredKeys,depthStringNew+".")
      elsif objectA[key].is_a?(Hash)  and !(ignoredKeys.include? key.to_s)
        messageError << compareHash(objectA[key],objectB[key],ignoredKeys,depthStringNew+".")
      else
        if objectA[key] != objectB[key] and !(ignoredKeys.include? key.to_s )
          messageError << depthStringNew + " has different values between objects.\n"
          messageError << "Object A: #{objectA[key]}\nObject B: #{objectB[key]}\n"
        end
      end
    end
    return messageError
  end


  def self.compareArray(objectA,objectB,ignoredKeys, depthString ='')
    messageError = ''
    objectA.each_index do |iteration|
      depthStringNew = depthString + "[#{iteration}]"
      if objectA[iteration].is_a?(Hash)
        messageError << compareHash(objectA[iteration],objectB[iteration],ignoredKeys,depthStringNew+".")
      elsif objectA[iteration].is_a?(Array)
        messageError << compareArray(objectA[iteration],objectB[iteration],ignoredKeys,depthStringNew+".")
      else
        if objectA[iteration] != objectB[iteration]
          messageError << depthStringNew + " has different values between objects.\n"
          messageError << "Object A: #{objectA[iteration]}\nObject B: #{objectB[iteration]}\n"
        end
      end
    end
    return messageError
  end

  def self.identical?(objectA, objectB, ignoredKeys=[])
    statusMessage = ''
    #sanity check
    if objectA.nil? and objectB.nil?
      puts "WARNING: Both objects are NULL. Identical."

    elsif objectA.nil? or objectB.nil?
      statusMessage << "One of the objects is NULL."
    else
      if objectA.is_a?(Array)
        statusMessage << compareArray(objectA,objectB,ignoredKeys)
      elsif objectA.is_a?(Hash)
         statusMessage << compareHash(objectA,objectB,ignoredKeys)
      else
        if objectA != objectB
          statusMessage << " ObjectA's Value:#{objectA}\n ObjectB's Value:#{objectB}\n"
        end
      end
    end
    if statusMessage != ''
      raise StandardError, statusMessage
      return FALSE
    else
      return TRUE
    end
  end


private_class_method :compareHash
  :compareArray

end