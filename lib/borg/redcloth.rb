
# line 1 "redcloth.rl"
# Compile with
# ragel -R redcloth.rl
#
class BorgRedCloth
  attr_reader :links

  def initialize
    @links = []

    
# line 55 "redcloth.rl"

    
# line 17 "redcloth.rb"
class << self
	attr_accessor :_borg_parser_actions
	private :_borg_parser_actions, :_borg_parser_actions=
end
self._borg_parser_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 1, 8, 1, 9, 1, 
	10, 1, 11, 1, 12, 1, 13, 1, 
	14, 1, 15, 1, 16, 1, 17, 2, 
	4, 5, 2, 4, 6, 2, 4, 7
]

class << self
	attr_accessor :_borg_parser_key_offsets
	private :_borg_parser_key_offsets, :_borg_parser_key_offsets=
end
self._borg_parser_key_offsets = [
	0, 1, 2, 3, 4, 5, 6, 11, 
	12, 13, 16, 18, 20, 22, 24, 26, 
	28, 30, 32, 34, 35, 36, 37, 38, 
	39, 40, 41, 42, 43, 44, 45, 46, 
	46, 47, 49, 51, 53, 55, 57, 59, 
	60, 61, 62, 62, 63, 65, 67, 69, 
	71, 73, 77, 80, 84, 85, 90, 91, 
	92, 94, 95, 96, 99
]

class << self
	attr_accessor :_borg_parser_trans_keys
	private :_borg_parser_trans_keys, :_borg_parser_trans_keys=
end
self._borg_parser_trans_keys = [
	35, 35, 35, 33, 34, 58, 35, 60, 
	91, 116, 123, 35, 35, 62, 48, 57, 
	48, 57, 48, 57, 48, 57, 47, 62, 
	48, 49, 48, 57, 47, 62, 48, 51, 
	48, 57, 62, 93, 93, 97, 103, 115, 
	125, 125, 111, 100, 101, 62, 60, 47, 
	60, 60, 99, 60, 111, 60, 100, 60, 
	101, 60, 62, 114, 101, 62, 60, 47, 
	60, 60, 112, 60, 114, 60, 101, 60, 
	62, 32, 64, 9, 13, 45, 65, 90, 
	45, 95, 65, 90, 95, 33, 34, 60, 
	64, 95, 35, 34, 99, 112, 60, 60, 
	32, 9, 13, 95, 0
]

class << self
	attr_accessor :_borg_parser_single_lengths
	private :_borg_parser_single_lengths, :_borg_parser_single_lengths=
end
self._borg_parser_single_lengths = [
	1, 1, 1, 1, 1, 1, 5, 1, 
	1, 1, 0, 0, 0, 2, 0, 0, 
	2, 0, 0, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 0, 
	1, 2, 2, 2, 2, 2, 2, 1, 
	1, 1, 0, 1, 2, 2, 2, 2, 
	2, 2, 1, 2, 1, 5, 1, 1, 
	2, 1, 1, 1, 1
]

class << self
	attr_accessor :_borg_parser_range_lengths
	private :_borg_parser_range_lengths, :_borg_parser_range_lengths=
end
self._borg_parser_range_lengths = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 1, 1, 1, 1, 0, 1, 1, 
	0, 1, 1, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 1, 1, 1, 0, 0, 0, 0, 
	0, 0, 0, 1, 0
]

class << self
	attr_accessor :_borg_parser_index_offsets
	private :_borg_parser_index_offsets, :_borg_parser_index_offsets=
end
self._borg_parser_index_offsets = [
	0, 2, 4, 6, 8, 10, 12, 18, 
	20, 22, 25, 27, 29, 31, 34, 36, 
	38, 41, 43, 45, 47, 49, 51, 53, 
	55, 57, 59, 61, 63, 65, 67, 69, 
	70, 72, 75, 78, 81, 84, 87, 90, 
	92, 94, 96, 97, 99, 102, 105, 108, 
	111, 114, 118, 121, 125, 127, 133, 135, 
	137, 140, 142, 144, 147
]

class << self
	attr_accessor :_borg_parser_indicies
	private :_borg_parser_indicies, :_borg_parser_indicies=
end
self._borg_parser_indicies = [
	2, 1, 0, 3, 4, 3, 5, 0, 
	7, 6, 8, 0, 9, 10, 11, 12, 
	13, 0, 0, 14, 15, 14, 15, 16, 
	0, 17, 0, 18, 0, 19, 0, 20, 
	15, 0, 21, 0, 22, 0, 23, 15, 
	0, 24, 0, 25, 0, 15, 0, 0, 
	26, 15, 26, 27, 0, 28, 0, 15, 
	0, 0, 29, 15, 29, 30, 0, 31, 
	0, 32, 0, 33, 0, 34, 36, 34, 
	37, 36, 34, 36, 38, 34, 36, 39, 
	34, 36, 40, 34, 36, 41, 34, 36, 
	42, 34, 43, 0, 44, 0, 45, 0, 
	46, 47, 46, 48, 47, 46, 47, 49, 
	46, 47, 50, 46, 47, 51, 46, 47, 
	52, 46, 0, 54, 0, 53, 55, 55, 
	0, 55, 56, 55, 0, 57, 0, 59, 
	60, 61, 62, 63, 58, 64, 1, 64, 
	6, 65, 66, 64, 36, 34, 47, 46, 
	64, 64, 53, 69, 64, 0
]

class << self
	attr_accessor :_borg_parser_trans_targs
	private :_borg_parser_trans_targs, :_borg_parser_trans_targs=
end
self._borg_parser_trans_targs = [
	53, 0, 1, 2, 3, 53, 4, 5, 
	6, 7, 9, 20, 22, 25, 8, 53, 
	10, 11, 12, 13, 14, 15, 16, 17, 
	18, 19, 21, 23, 24, 26, 28, 29, 
	30, 31, 32, 53, 33, 34, 35, 36, 
	37, 38, 57, 40, 41, 42, 43, 44, 
	45, 46, 47, 48, 58, 49, 53, 51, 
	52, 53, 53, 54, 55, 56, 59, 60, 
	53, 27, 39, 53, 53, 50
]

class << self
	attr_accessor :_borg_parser_trans_actions
	private :_borg_parser_trans_actions, :_borg_parser_trans_actions=
end
self._borg_parser_trans_actions = [
	27, 0, 3, 0, 0, 15, 0, 0, 
	0, 1, 1, 1, 1, 1, 0, 13, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 29, 0, 0, 0, 0, 
	0, 0, 31, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 34, 0, 11, 0, 
	0, 17, 19, 9, 9, 37, 9, 9, 
	25, 0, 0, 21, 23, 0
]

class << self
	attr_accessor :_borg_parser_to_state_actions
	private :_borg_parser_to_state_actions, :_borg_parser_to_state_actions=
end
self._borg_parser_to_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 5, 0, 0, 
	0, 0, 0, 0, 0
]

class << self
	attr_accessor :_borg_parser_from_state_actions
	private :_borg_parser_from_state_actions, :_borg_parser_from_state_actions=
end
self._borg_parser_from_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 7, 0, 0, 
	0, 0, 0, 0, 0
]

class << self
	attr_accessor :_borg_parser_eof_trans
	private :_borg_parser_eof_trans, :_borg_parser_eof_trans=
end
self._borg_parser_eof_trans = [
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	36, 36, 36, 36, 36, 36, 36, 1, 
	1, 1, 1, 36, 36, 36, 36, 36, 
	36, 1, 1, 1, 1, 0, 65, 65, 
	65, 68, 69, 65, 65
]

class << self
	attr_accessor :borg_parser_start
end
self.borg_parser_start = 53;
class << self
	attr_accessor :borg_parser_first_final
end
self.borg_parser_first_final = 53;
class << self
	attr_accessor :borg_parser_error
end
self.borg_parser_error = -1;

class << self
	attr_accessor :borg_parser_en_main
end
self.borg_parser_en_main = 53;


# line 57 "redcloth.rl"
  end
  
  def parse(data)
    source = data
    data = data.unpack("c*") if data.is_a?(String)
    eof = data.length

    
# line 241 "redcloth.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = borg_parser_start
	ts = nil
	te = nil
	act = 0
end

# line 65 "redcloth.rl"
    
# line 253 "redcloth.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	end
	if _goto_level <= _resume
	_acts = _borg_parser_from_state_actions[cs]
	_nacts = _borg_parser_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _borg_parser_actions[_acts - 1]
			when 3 then
# line 1 "NONE"
		begin
ts = p
		end
# line 283 "redcloth.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _borg_parser_key_offsets[cs]
	_trans = _borg_parser_index_offsets[cs]
	_klen = _borg_parser_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p] < _borg_parser_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p] > _borg_parser_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _borg_parser_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p] < _borg_parser_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p] > _borg_parser_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	_trans = _borg_parser_indicies[_trans]
	end
	if _goto_level <= _eof_trans
	cs = _borg_parser_trans_targs[_trans]
	if _borg_parser_trans_actions[_trans] != 0
		_acts = _borg_parser_trans_actions[_trans]
		_nacts = _borg_parser_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _borg_parser_actions[_acts - 1]
when 0 then
# line 18 "redcloth.rl"
		begin

        @mark_link = p
      		end
when 1 then
# line 21 "redcloth.rl"
		begin
 @mark_link = p 		end
when 4 then
# line 1 "NONE"
		begin
te = p+1
		end
when 5 then
# line 29 "redcloth.rl"
		begin
act = 1;		end
when 6 then
# line 30 "redcloth.rl"
		begin
act = 2;		end
when 7 then
# line 53 "redcloth.rl"
		begin
act = 7;		end
when 8 then
# line 31 "redcloth.rl"
		begin
te = p+1
		end
when 9 then
# line 32 "redcloth.rl"
		begin
te = p+1
 begin 
          @links << {
            :start => @mark_link,
            :end => te-1,
            :text => source[@mark_link..(te-1)]
          }
         end
		end
when 10 then
# line 39 "redcloth.rl"
		begin
te = p+1
 begin 
          @links << {
            :start => @mark_link,
            :end => te-2,
            :text => source[@mark_link..(te-2)]
          }
         end
		end
when 11 then
# line 46 "redcloth.rl"
		begin
te = p+1
 begin  
          @links << {
            :start => ts,
            :end => te-1,
            :text => source[ts..(te-1)]
          }
         end
		end
when 12 then
# line 53 "redcloth.rl"
		begin
te = p+1
		end
when 13 then
# line 29 "redcloth.rl"
		begin
te = p
p = p - 1;		end
when 14 then
# line 30 "redcloth.rl"
		begin
te = p
p = p - 1;		end
when 15 then
# line 53 "redcloth.rl"
		begin
te = p
p = p - 1;		end
when 16 then
# line 53 "redcloth.rl"
		begin
 begin p = ((te))-1; end
		end
when 17 then
# line 1 "NONE"
		begin
	case act
	when 1 then
	begin begin p = ((te))-1; end
end
	when 2 then
	begin begin p = ((te))-1; end
end
	when 7 then
	begin begin p = ((te))-1; end
end
end 
			end
# line 458 "redcloth.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _borg_parser_to_state_actions[cs]
	_nacts = _borg_parser_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _borg_parser_actions[_acts - 1]
when 2 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 478 "redcloth.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _borg_parser_eof_trans[cs] > 0
		_trans = _borg_parser_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 66 "redcloth.rl"
  end

end