require 'minitest/autorun'
require './Identicial/assert'

class TestAssert < Minitest::Test


  my_simple_object = {
      key1: 'value 1',
      key2: 3,
      key3: ['a', 'b', 'c'],
  }

  my_simple_object_2 = {
      key1: 'value 100',
      key2: 30,
      key3: ['c', 'b', 'a'],
  }




  def test_Identical_True
    my_complex_object = [
        {
            key1: 'val1',
            key2: 'val2',
            key3: [
                {
                    subkey_1: ['a', 'b', 'c'],
                    subkey_2: "some value",
                },
                {
                    subkey_1: ['d', 'e', 'f'],
                    subkey_2: "another value",
                }
            ]
        },
        {
            key1: 'val3',
            key2: 'val4',
            key3: [
                {
                    subkey_1: ['g', 'h', 'i'],
                    subkey_2: "a different value",
                },
                {
                    subkey_1: ['j', 'k', 'l'],
                    subkey_2: "value",
                }
            ]
        },
    ]
    assert Assert.identical?(my_complex_object,my_complex_object)
  end
  def test_Identical_False
    my_simple_object = {
        key1: 'value 1',
        key2: 3,
        key3: ['a', 'b', 'c'],
    }

    my_simple_object_2 = {
        key1: 'value 100',
        key2: 30,
        key3: ['c', 'b', 'a'],
    }
    Assert.identical?(my_simple_object,my_simple_object_2)
  rescue StandardError => stderr
    puts stderr.message

  end

end