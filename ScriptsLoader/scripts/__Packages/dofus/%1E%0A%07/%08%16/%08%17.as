class dofus.§\x1e\n\x07§.§\b\x16§.§\b\x17§
{
   var name;
   var upperName;
   var lowerName;
   static var VOWELS = ["A","E","I","O","U","Y"];
   static var CONSONANTS = ["B","C","D","F","G","H","J","K","L","M","N","P","Q","R","S","T","V","W","X","Z"];
   function §\b\x17§(§\x1e\x0f\x16§)
   {
      this.name = _loc2_;
      this.upperName = _loc2_.toUpperCase();
      this.lowerName = _loc2_.toLowerCase();
   }
   function isValidAgainst(§\x1e\x15\x01§)
   {
      if(!this.checkLength(_loc2_.getMinNameLength(),_loc2_.getMaxNameLength()))
      {
         return false;
      }
      if(!_loc2_.getIsAllowingSpaces() && this.checkContainSpaces())
      {
         return false;
      }
      if(!this.checkDashesCount(_loc2_.getNumberOfAllowedDashes()))
      {
         return false;
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.getNoDashesOnTheseIndexes().length)
      {
         if(!this.checkBorderingDashes(_loc2_.getNoDashesOnTheseIndexes()[_loc3_]))
         {
            return false;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(_loc2_.getIfFirstCharMustBeUppercase() && !this.checkUpperCaseOnFirstChar())
      {
         return false;
      }
      if(_loc2_.getIfNoCharAfterTheFirstMustBeUppercase() && !this.checkUpperCaseElsewhere(_loc2_.getCharAllowingUppercase()))
      {
         return false;
      }
      if(_loc2_.getIfCannotEndWithUppercase() && !this.checkLastIsUppercase())
      {
         return false;
      }
      if(!this.checkCannotBeEqualTo(_loc2_.getStrictlyEqualsProhibedWords()))
      {
         return false;
      }
      if(!this.checkCannotContain(_loc2_.getContainingProhibedWords()))
      {
         return false;
      }
      if(!this.checkCannotStartWith(_loc2_.getBeginningProhibedWords()))
      {
         return false;
      }
      if(!this.checkCannotEndWith(_loc2_.getEndingProhibedWords()))
      {
         return false;
      }
      if(!this.checkContainsAtLeastNFromArray(_loc2_.getMinimumVowelsCount(),dofus["\x1e\n\x07"]["\b\x16"]["\b\x17"].VOWELS))
      {
         return false;
      }
      if(!this.checkContainsAtLeastNFromArray(_loc2_.getMinimumConsonantsCount(),dofus["\x1e\n\x07"]["\b\x16"]["\b\x17"].CONSONANTS))
      {
         return false;
      }
      if(!this.checkMaximumRepetitionOfSimultaneousLetters(_loc2_.getMaxRepetitionForOneChar()))
      {
         return false;
      }
      return true;
   }
   function isValidAgainstWithDetails(§\x1e\x15\x01§)
   {
      var _loc3_ = new dofus["\x1e\n\x07"]["\b\x16"]["\x12\x1b"]();
      _loc3_.IS_SUCCESS = true;
      if(!this.checkLength(_loc2_.getMinNameLength(),_loc2_.getMaxNameLength()))
      {
         _loc3_.FAILED_ON_LENGTH_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      if(this.name.length == 0)
      {
         _loc3_.FAILED_ON_LENGTH_CHECK = true;
         _loc3_.IS_SUCCESS = false;
         return _loc3_;
      }
      if(!_loc2_.getIsAllowingSpaces() && this.checkContainSpaces())
      {
         _loc3_.FAILED_ON_SPACES_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      if(!this.checkDashesCount(_loc2_.getNumberOfAllowedDashes()))
      {
         _loc3_.FAILED_ON_DASHES_COUNT_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      var _loc4_ = 0;
      while(_loc4_ < _loc2_.getNoDashesOnTheseIndexes().length)
      {
         if(!this.checkBorderingDashes(_loc2_.getNoDashesOnTheseIndexes()[_loc4_]))
         {
            _loc3_.FAILED_ON_DASHES_AT_INDEXES_CHECK = true;
            _loc3_.IS_SUCCESS = false;
            break;
         }
         _loc4_ = _loc4_ + 1;
      }
      if(_loc2_.getIfFirstCharMustBeUppercase() && !this.checkUpperCaseOnFirstChar())
      {
         _loc3_.FAILED_ON_UPPERCASE_FIRST_CHAR_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      if(_loc2_.getIfNoCharAfterTheFirstMustBeUppercase() && !this.checkUpperCaseElsewhere(_loc2_.getCharAllowingUppercase()))
      {
         _loc3_.FAILED_ON_UPPERCASE_AFTER_THE_FIRST_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      if(_loc2_.getIfCannotEndWithUppercase() && !this.checkLastIsUppercase())
      {
         _loc3_.FAILED_ON_UPPERCASE_AT_THE_END_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      if(!this.checkCannotBeEqualTo(_loc2_.getStrictlyEqualsProhibedWords()))
      {
         _loc3_.FAILED_ON_STRICTLY_EQUALS_PROHIBED_WORDS_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      if(!this.checkCannotContain(_loc2_.getContainingProhibedWords()))
      {
         _loc3_.FAILED_ON_CONTAINING_PROHIBED_WORDS_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      if(!this.checkCannotStartWith(_loc2_.getBeginningProhibedWords()))
      {
         _loc3_.FAILED_ON_BEGINNING_WITH_PROHIBED_WORDS_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      if(!this.checkCannotEndWith(_loc2_.getEndingProhibedWords()))
      {
         _loc3_.FAILED_ON_ENDING_WITH_PROHIBED_WORDS_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      if(!this.checkContainsAtLeastNFromArray(_loc2_.getMinimumVowelsCount(),dofus["\x1e\n\x07"]["\b\x16"]["\b\x17"].VOWELS))
      {
         _loc3_.FAILED_ON_VOWELS_COUNT_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      if(!this.checkContainsAtLeastNFromArray(_loc2_.getMinimumConsonantsCount(),dofus["\x1e\n\x07"]["\b\x16"]["\b\x17"].CONSONANTS))
      {
         _loc3_.FAILED_ON_CONSONANTS_COUNT_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      if(!this.checkMaximumRepetitionOfSimultaneousLetters(_loc2_.getMaxRepetitionForOneChar()))
      {
         _loc3_.FAILED_ON_REPETITION_CHECK = true;
         _loc3_.IS_SUCCESS = false;
      }
      return _loc3_;
   }
   function checkLength(§\x02\x10§, §\x02\x1d§)
   {
      if(this.name.length < _loc2_ || this.name.length > _loc3_)
      {
         return false;
      }
      return true;
   }
   function checkContainSpaces()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.name.length)
      {
         if(this.name.charAt(_loc2_) == " ")
         {
            return true;
         }
         _loc2_ = _loc2_ + 1;
      }
      return false;
   }
   function checkBorderingDashes(§\x04\n§)
   {
      if(this.name.charAt(_loc2_) == "-" || this.name.charAt(this.name.length - 1 - _loc2_) == "-")
      {
         return false;
      }
      return true;
   }
   function checkDashesCount(§\x03\x04§)
   {
      var _loc3_ = 0;
      var _loc4_ = 0;
      while(_loc4_ < this.name.length)
      {
         if(this.name.charAt(_loc4_) == "-")
         {
            if((_loc3_ = _loc3_ + 1) > _loc2_)
            {
               return false;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
      return true;
   }
   function checkUpperCaseOnFirstChar()
   {
      if(this.upperName.charAt(0) != this.name.charAt(0))
      {
         return false;
      }
      return true;
   }
   function checkUpperCaseElsewhere(§\x1e\x18§)
   {
      var _loc3_ = 1;
      while(_loc3_ < this.name.length)
      {
         if(this.lowerName.charAt(_loc3_) != this.name.charAt(_loc3_))
         {
            var _loc4_ = false;
            var _loc5_ = 0;
            while(_loc5_ < _loc2_.length)
            {
               if(this.name.charAt(_loc3_ - 1) == _loc2_[_loc5_])
               {
                  _loc4_ = true;
               }
               _loc5_ = _loc5_ + 1;
            }
            if(!_loc4_)
            {
               return false;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      return true;
   }
   function checkLastIsUppercase()
   {
      if(this.lowerName.charAt(this.name.length - 1) != this.name.charAt(this.name.length - 1))
      {
         return false;
      }
      return true;
   }
   function checkCannotBeEqualTo(§\x1d\x17§)
   {
      if(_loc2_ == null)
      {
         return true;
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         if(this.upperName == _loc2_[_loc3_])
         {
            return false;
         }
         _loc3_ = _loc3_ + 1;
      }
      return true;
   }
   function checkCannotContain(§\x1d\x17§)
   {
      if(_loc2_ == null)
      {
         return true;
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         if(this.upperName.indexOf(_loc2_[_loc3_]) > -1)
         {
            return false;
         }
         _loc3_ = _loc3_ + 1;
      }
      return true;
   }
   function checkCannotStartWith(§\x1d\x17§)
   {
      if(_loc2_ == null)
      {
         return true;
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         if(this.upperName.indexOf(_loc2_[_loc3_]) == 0)
         {
            return false;
         }
         _loc3_ = _loc3_ + 1;
      }
      return true;
   }
   function checkCannotEndWith(§\x1d\x17§)
   {
      if(_loc2_ == null)
      {
         return true;
      }
      var _loc3_ = 0;
      while(_loc3_ < _loc2_.length)
      {
         if(this.upperName.indexOf(_loc2_[_loc3_],this.upperName.length - _loc2_[_loc3_].length) == this.upperName.length - _loc2_[_loc3_].length)
         {
            return false;
         }
         _loc3_ = _loc3_ + 1;
      }
      return true;
   }
   function checkContainsAtLeastNFromArray(§\x06\x17§, §\r§)
   {
      var _loc4_ = 0;
      var _loc5_ = 0;
      while(_loc5_ < this.name.length)
      {
         var _loc6_ = 0;
         while(_loc6_ < _loc3_.length)
         {
            if(this.upperName.charAt(_loc5_) == _loc3_[_loc6_])
            {
               if((_loc4_ = _loc4_ + 1) >= _loc2_)
               {
                  return true;
               }
            }
            _loc6_ = _loc6_ + 1;
         }
         _loc5_ = _loc5_ + 1;
      }
      return false;
   }
   function checkMaximumRepetitionOfSimultaneousLetters(§\x02\x19§)
   {
      var _loc3_ = new String();
      var _loc4_ = 0;
      var _loc5_ = 0;
      while(_loc5_ < this.name.length)
      {
         if(_loc3_ == (_loc3_ = this.name.charAt(_loc5_)))
         {
            if((_loc4_ = _loc4_ + 1) > _loc2_ - 1)
            {
               return false;
            }
         }
         _loc5_ = _loc5_ + 1;
      }
      return true;
   }
}
