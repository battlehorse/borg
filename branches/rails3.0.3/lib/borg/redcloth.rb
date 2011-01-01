
# line 1 "redcloth.rl"
# Compile with
# ragel -R redcloth.rl
#
class BorgRedCloth
  attr_reader :links, :cliparts

  def initialize
    @links = []
    @cliparts = []

    
# line 48 "redcloth.rl"

    
# line 18 "redcloth.rb"
class << self
	attr_accessor :_borg_parser_actions
	private :_borg_parser_actions, :_borg_parser_actions=
end
self._borg_parser_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 7, 1, 8, 1, 9, 1, 
	10, 1, 11, 1, 12, 1, 13, 1, 
	14, 1, 15, 2, 3, 4, 2, 3, 
	5, 2, 3, 6
]

class << self
	attr_accessor :_borg_parser_key_offsets
	private :_borg_parser_key_offsets, :_borg_parser_key_offsets=
end
self._borg_parser_key_offsets = [
	0, 1, 2, 7, 8, 9, 12, 14, 
	16, 18, 20, 22, 24, 26, 28, 30, 
	31, 32, 33, 34, 35, 36, 37, 38, 
	39, 40, 41, 42, 42, 43, 45, 47, 
	49, 51, 53, 55, 56, 57, 58, 58, 
	59, 61, 63, 65, 67, 69, 73, 76, 
	80, 81, 85, 86, 88, 89, 90, 93
]

class << self
	attr_accessor :_borg_parser_trans_keys
	private :_borg_parser_trans_keys, :_borg_parser_trans_keys=
end
self._borg_parser_trans_keys = [
	34, 58, 35, 60, 91, 116, 123, 35, 
	35, 62, 48, 57, 48, 57, 48, 57, 
	48, 57, 47, 62, 48, 49, 48, 57, 
	47, 62, 48, 51, 48, 57, 62, 93, 
	93, 97, 103, 115, 125, 125, 111, 100, 
	101, 62, 60, 47, 60, 60, 99, 60, 
	111, 60, 100, 60, 101, 60, 62, 114, 
	101, 62, 60, 47, 60, 60, 112, 60, 
	114, 60, 101, 60, 62, 32, 64, 9, 
	13, 45, 65, 90, 45, 95, 65, 90, 
	95, 34, 60, 64, 95, 34, 99, 112, 
	60, 60, 32, 9, 13, 95, 0
]

class << self
	attr_accessor :_borg_parser_single_lengths
	private :_borg_parser_single_lengths, :_borg_parser_single_lengths=
end
self._borg_parser_single_lengths = [
	1, 1, 5, 1, 1, 1, 0, 0, 
	0, 2, 0, 0, 2, 0, 0, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 0, 1, 2, 2, 2, 
	2, 2, 2, 1, 1, 1, 0, 1, 
	2, 2, 2, 2, 2, 2, 1, 2, 
	1, 4, 1, 2, 1, 1, 1, 1
]

class << self
	attr_accessor :_borg_parser_range_lengths
	private :_borg_parser_range_lengths, :_borg_parser_range_lengths=
end
self._borg_parser_range_lengths = [
	0, 0, 0, 0, 0, 1, 1, 1, 
	1, 0, 1, 1, 0, 1, 1, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 1, 1, 1, 
	0, 0, 0, 0, 0, 0, 1, 0
]

class << self
	attr_accessor :_borg_parser_index_offsets
	private :_borg_parser_index_offsets, :_borg_parser_index_offsets=
end
self._borg_parser_index_offsets = [
	0, 2, 4, 10, 12, 14, 17, 19, 
	21, 23, 26, 28, 30, 33, 35, 37, 
	39, 41, 43, 45, 47, 49, 51, 53, 
	55, 57, 59, 61, 62, 64, 67, 70, 
	73, 76, 79, 82, 84, 86, 88, 89, 
	91, 94, 97, 100, 103, 106, 110, 113, 
	117, 119, 124, 126, 129, 131, 133, 136
]

class << self
	attr_accessor :_borg_parser_indicies
	private :_borg_parser_indicies, :_borg_parser_indicies=
end
self._borg_parser_indicies = [
	2, 1, 3, 0, 4, 5, 6, 7, 
	8, 0, 0, 9, 10, 9, 10, 11, 
	0, 12, 0, 13, 0, 14, 0, 15, 
	10, 0, 16, 0, 17, 0, 18, 10, 
	0, 19, 0, 20, 0, 10, 0, 0, 
	21, 10, 21, 22, 0, 23, 0, 10, 
	0, 0, 24, 10, 24, 25, 0, 26, 
	0, 27, 0, 28, 0, 29, 31, 29, 
	32, 31, 29, 31, 33, 29, 31, 34, 
	29, 31, 35, 29, 31, 36, 29, 31, 
	37, 29, 38, 0, 39, 0, 40, 0, 
	41, 42, 41, 43, 42, 41, 42, 44, 
	41, 42, 45, 41, 42, 46, 41, 42, 
	47, 41, 0, 49, 0, 48, 50, 50, 
	0, 50, 51, 50, 0, 52, 0, 54, 
	55, 56, 57, 53, 58, 1, 59, 60, 
	58, 31, 29, 42, 41, 58, 58, 48, 
	63, 58, 0
]

class << self
	attr_accessor :_borg_parser_trans_targs
	private :_borg_parser_trans_targs, :_borg_parser_trans_targs=
end
self._borg_parser_trans_targs = [
	49, 0, 1, 2, 3, 5, 16, 18, 
	21, 4, 49, 6, 7, 8, 9, 10, 
	11, 12, 13, 14, 15, 17, 19, 20, 
	22, 24, 25, 26, 27, 28, 49, 29, 
	30, 31, 32, 33, 34, 52, 36, 37, 
	38, 39, 40, 41, 42, 43, 44, 53, 
	45, 49, 47, 48, 49, 49, 50, 51, 
	54, 55, 49, 23, 35, 49, 49, 46
]

class << self
	attr_accessor :_borg_parser_trans_actions
	private :_borg_parser_trans_actions, :_borg_parser_trans_actions=
end
self._borg_parser_trans_actions = [
	23, 0, 0, 0, 1, 1, 1, 1, 
	1, 0, 11, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 25, 0, 
	0, 0, 0, 0, 0, 27, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 30, 
	0, 9, 0, 0, 13, 15, 7, 33, 
	7, 7, 21, 0, 0, 17, 19, 0
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
	0, 3, 0, 0, 0, 0, 0, 0
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
	0, 5, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_borg_parser_eof_trans
	private :_borg_parser_eof_trans, :_borg_parser_eof_trans=
end
self._borg_parser_eof_trans = [
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 31, 31, 31, 31, 
	31, 31, 31, 1, 1, 1, 1, 31, 
	31, 31, 31, 31, 31, 1, 1, 1, 
	1, 0, 59, 59, 62, 63, 59, 59
]

class << self
	attr_accessor :borg_parser_start
end
self.borg_parser_start = 49;
class << self
	attr_accessor :borg_parser_first_final
end
self.borg_parser_first_final = 49;
class << self
	attr_accessor :borg_parser_error
end
self.borg_parser_error = -1;

class << self
	attr_accessor :borg_parser_en_main
end
self.borg_parser_en_main = 49;


# line 50 "redcloth.rl"
  end
  
  def parse(data)
    source = data
    data = data.unpack("c*") if data.is_a?(String)
    eof = data.length

    
# line 231 "redcloth.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = borg_parser_start
	ts = nil
	te = nil
	act = 0
end

# line 58 "redcloth.rl"
    
# line 243 "redcloth.rb"
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
			when 2 then
# line 1 "NONE"
		begin
ts = p
		end
# line 273 "redcloth.rb"
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
# line 19 "redcloth.rl"
		begin

        @mark_link = p
      		end
when 3 then
# line 1 "NONE"
		begin
te = p+1
		end
when 4 then
# line 29 "redcloth.rl"
		begin
act = 1;		end
when 5 then
# line 30 "redcloth.rl"
		begin
act = 2;		end
when 6 then
# line 46 "redcloth.rl"
		begin
act = 6;		end
when 7 then
# line 31 "redcloth.rl"
		begin
te = p+1
		end
when 8 then
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
when 9 then
# line 39 "redcloth.rl"
		begin
te = p+1
 begin  
          @cliparts << {
            :start => ts,
            :end => te-1,
            :text => source[ts..(te-1)]
          }
         end
		end
when 10 then
# line 46 "redcloth.rl"
		begin
te = p+1
		end
when 11 then
# line 29 "redcloth.rl"
		begin
te = p
p = p - 1;		end
when 12 then
# line 30 "redcloth.rl"
		begin
te = p
p = p - 1;		end
when 13 then
# line 46 "redcloth.rl"
		begin
te = p
p = p - 1;		end
when 14 then
# line 46 "redcloth.rl"
		begin
 begin p = ((te))-1; end
		end
when 15 then
# line 1 "NONE"
		begin
	case act
	when 1 then
	begin begin p = ((te))-1; end
end
	when 2 then
	begin begin p = ((te))-1; end
end
	when 6 then
	begin begin p = ((te))-1; end
end
end 
			end
# line 432 "redcloth.rb"
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
when 1 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 452 "redcloth.rb"
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

# line 59 "redcloth.rl"
  end

end