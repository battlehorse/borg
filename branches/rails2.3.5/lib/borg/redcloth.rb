
# line 1 "redcloth.rl"
# Compile with
# ragel -R redcloth.rl
#
class BorgRedCloth
  attr_reader :links, :cliparts

  def initialize
    @links = []
    @cliparts = []

    
# line 47 "redcloth.rl"

    
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
	0, 1, 2, 6, 9, 11, 13, 15, 
	17, 19, 21, 23, 25, 27, 28, 29, 
	30, 31, 32, 33, 34, 35, 36, 37, 
	38, 39, 39, 40, 42, 44, 46, 48, 
	50, 52, 53, 54, 55, 55, 56, 58, 
	60, 62, 64, 66, 70, 73, 77, 78, 
	82, 83, 85, 86, 87, 90
]

class << self
	attr_accessor :_borg_parser_trans_keys
	private :_borg_parser_trans_keys, :_borg_parser_trans_keys=
end
self._borg_parser_trans_keys = [
	34, 58, 60, 91, 116, 123, 62, 48, 
	57, 48, 57, 48, 57, 48, 57, 47, 
	62, 48, 49, 48, 57, 47, 62, 48, 
	51, 48, 57, 62, 93, 93, 97, 103, 
	115, 125, 125, 111, 100, 101, 62, 60, 
	47, 60, 60, 99, 60, 111, 60, 100, 
	60, 101, 60, 62, 114, 101, 62, 60, 
	47, 60, 60, 112, 60, 114, 60, 101, 
	60, 62, 32, 64, 9, 13, 45, 65, 
	90, 45, 95, 65, 90, 95, 34, 60, 
	64, 95, 34, 99, 112, 60, 60, 32, 
	9, 13, 95, 0
]

class << self
	attr_accessor :_borg_parser_single_lengths
	private :_borg_parser_single_lengths, :_borg_parser_single_lengths=
end
self._borg_parser_single_lengths = [
	1, 1, 4, 1, 0, 0, 0, 2, 
	0, 0, 2, 0, 0, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 0, 1, 2, 2, 2, 2, 2, 
	2, 1, 1, 1, 0, 1, 2, 2, 
	2, 2, 2, 2, 1, 2, 1, 4, 
	1, 2, 1, 1, 1, 1
]

class << self
	attr_accessor :_borg_parser_range_lengths
	private :_borg_parser_range_lengths, :_borg_parser_range_lengths=
end
self._borg_parser_range_lengths = [
	0, 0, 0, 1, 1, 1, 1, 0, 
	1, 1, 0, 1, 1, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 1, 1, 1, 0, 0, 
	0, 0, 0, 0, 1, 0
]

class << self
	attr_accessor :_borg_parser_index_offsets
	private :_borg_parser_index_offsets, :_borg_parser_index_offsets=
end
self._borg_parser_index_offsets = [
	0, 2, 4, 9, 12, 14, 16, 18, 
	21, 23, 25, 28, 30, 32, 34, 36, 
	38, 40, 42, 44, 46, 48, 50, 52, 
	54, 56, 57, 59, 62, 65, 68, 71, 
	74, 77, 79, 81, 83, 84, 86, 89, 
	92, 95, 98, 101, 105, 108, 112, 114, 
	119, 121, 124, 126, 128, 131
]

class << self
	attr_accessor :_borg_parser_indicies
	private :_borg_parser_indicies, :_borg_parser_indicies=
end
self._borg_parser_indicies = [
	2, 1, 3, 0, 4, 5, 6, 7, 
	0, 9, 8, 0, 10, 0, 11, 0, 
	12, 0, 13, 9, 0, 14, 0, 15, 
	0, 16, 9, 0, 17, 0, 18, 0, 
	9, 0, 0, 19, 9, 19, 20, 0, 
	21, 0, 9, 0, 0, 22, 9, 22, 
	23, 0, 24, 0, 25, 0, 26, 0, 
	27, 29, 27, 30, 29, 27, 29, 31, 
	27, 29, 32, 27, 29, 33, 27, 29, 
	34, 27, 29, 35, 27, 36, 0, 37, 
	0, 38, 0, 39, 40, 39, 41, 40, 
	39, 40, 42, 39, 40, 43, 39, 40, 
	44, 39, 40, 45, 39, 0, 47, 0, 
	46, 48, 48, 0, 48, 49, 48, 0, 
	50, 0, 52, 53, 54, 55, 51, 56, 
	1, 57, 58, 56, 29, 27, 40, 39, 
	56, 56, 46, 61, 56, 0
]

class << self
	attr_accessor :_borg_parser_trans_targs
	private :_borg_parser_trans_targs, :_borg_parser_trans_targs=
end
self._borg_parser_trans_targs = [
	47, 0, 1, 2, 3, 14, 16, 19, 
	4, 47, 5, 6, 7, 8, 9, 10, 
	11, 12, 13, 15, 17, 18, 20, 22, 
	23, 24, 25, 26, 47, 27, 28, 29, 
	30, 31, 32, 50, 34, 35, 36, 37, 
	38, 39, 40, 41, 42, 51, 43, 47, 
	45, 46, 47, 47, 48, 49, 52, 53, 
	47, 21, 33, 47, 47, 44
]

class << self
	attr_accessor :_borg_parser_trans_actions
	private :_borg_parser_trans_actions, :_borg_parser_trans_actions=
end
self._borg_parser_trans_actions = [
	23, 0, 0, 0, 1, 1, 1, 1, 
	0, 11, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 25, 0, 0, 0, 
	0, 0, 0, 27, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 30, 0, 9, 
	0, 0, 13, 15, 7, 33, 7, 7, 
	21, 0, 0, 17, 19, 0
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
	0, 0, 0, 0, 0, 0, 0, 3, 
	0, 0, 0, 0, 0, 0
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
	0, 0, 0, 0, 0, 0, 0, 5, 
	0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_borg_parser_eof_trans
	private :_borg_parser_eof_trans, :_borg_parser_eof_trans=
end
self._borg_parser_eof_trans = [
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 1, 1, 1, 1, 1, 1, 
	1, 1, 29, 29, 29, 29, 29, 29, 
	29, 1, 1, 1, 1, 29, 29, 29, 
	29, 29, 29, 1, 1, 1, 1, 0, 
	57, 57, 60, 61, 57, 57
]

class << self
	attr_accessor :borg_parser_start
end
self.borg_parser_start = 47;
class << self
	attr_accessor :borg_parser_first_final
end
self.borg_parser_first_final = 47;
class << self
	attr_accessor :borg_parser_error
end
self.borg_parser_error = -1;

class << self
	attr_accessor :borg_parser_en_main
end
self.borg_parser_en_main = 47;


# line 49 "redcloth.rl"
  end
  
  def parse(data)
    source = data
    data = data.unpack("c*") if data.is_a?(String)
    eof = data.length

    
# line 230 "redcloth.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = borg_parser_start
	ts = nil
	te = nil
	act = 0
end

# line 57 "redcloth.rl"
    
# line 242 "redcloth.rb"
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
# line 272 "redcloth.rb"
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
when 3 then
# line 1 "NONE"
		begin
te = p+1
		end
when 4 then
# line 28 "redcloth.rl"
		begin
act = 1;		end
when 5 then
# line 29 "redcloth.rl"
		begin
act = 2;		end
when 6 then
# line 45 "redcloth.rl"
		begin
act = 6;		end
when 7 then
# line 30 "redcloth.rl"
		begin
te = p+1
		end
when 8 then
# line 31 "redcloth.rl"
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
# line 38 "redcloth.rl"
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
# line 45 "redcloth.rl"
		begin
te = p+1
		end
when 11 then
# line 28 "redcloth.rl"
		begin
te = p
p = p - 1;		end
when 12 then
# line 29 "redcloth.rl"
		begin
te = p
p = p - 1;		end
when 13 then
# line 45 "redcloth.rl"
		begin
te = p
p = p - 1;		end
when 14 then
# line 45 "redcloth.rl"
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
# line 431 "redcloth.rb"
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
# line 451 "redcloth.rb"
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

# line 58 "redcloth.rl"
  end

end