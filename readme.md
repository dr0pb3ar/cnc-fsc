# CNC FSC (Feeds 'n Speeds Calculator)

Just a little script to calculate ideal feeds and speeds for CNC.

## Requires

- ruby
- pry

## Usage

```
ruby fsc.rb                                                                             master  ✱
Vars:
@mpm
@diameter
@max_rpm
@max_feed_rate
@num_flutes
@chipload
[1] pry(#<C>)>
```

*Set Vars*
```
[1] pry(#<C>)> @chipload = 0.2
=> 0.2
```

*Print*
```
[2] pry(#<C>)> print
MPM:              60m/min
Chipload:         0.2mm
Tool Diameter:    6mm
Tool Flute Count: 2
Max RPM:          10000rpm
Ideal RPM:        3183.1rpm
Max FeedRate:     2000mm/s
Ideal FeedRate:   1273.24mm/s

Achievable feed and speed:
RPM:       3183.1rpm
FeedRate:  1273.24mm/s
```
