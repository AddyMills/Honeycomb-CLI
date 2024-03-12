
script TileSprite \{PARENT = root_window container_type = containerElement tile_dims = (1280.0, 720.0) pos = (0.0, 0.0) sprite_props = {} container_props = {}}
	if NOT gotParam \{texture}
		Printf \{"TileSprite needs a texture"}
		return
	endif
	createScreenElement {
		Type = <container_type>
		PARENT = <PARENT>
		Dims = <tile_dims>
		pos = <pos>
		just = [Left top]
		child_anchor = [Left top]
		<container_props>
	}
	<container_id> = <Id>
	if NOT gotParam \{Dims}
		createScreenElement {
			Type = spriteElement
			PARENT = <PARENT>
			texture = <texture>
		}
		getScreenElementDims Id = <Id>
		if ((<width> < 1) || (<Height> < 1))
			Printf \{"why is the width or height not positive?"}
			DestroyScreenelement Id = <container_id>
			return
		endif
		DestroyScreenelement Id = <Id>
	else
		<width> = (<Dims> [0])
		<Height> = (<Dims> [1])
	endif
	<container_id> :SetTags {
		width = <width>
		Height = <Height>
		pos = <pos>
	}
	if gotParam \{flip_h}
		<container_id> :SetTags {
			flip_h
		}
	endif
	if gotParam \{flip_v}
		<container_id> :SetTags {
			flip_v
		}
	endif
	<X> = 0
	<Y> = 0
	<row> = 0
	<column> = 0
	<count> = 0
	begin
	<Flip> = {}
	if gotParam \{flip_h}
		Mod A = <row> B = (2)
		if (<Mod> = 0)
			<Flip> = {flip_h}
		endif
	endif
	if gotParam \{flip_v}
		Mod A = <column> B = (2)
		if (<Mod> = 0)
			<Flip> = {<Flip> flip_v}
		endif
	endif
	createScreenElement {
		Type = spriteElement
		PARENT = <container_id>
		texture = <texture>
		Dims = <Dims>
		just = [Left top]
		pos = (((1.0, 0.0) * <X>) + ((0.0, 1.0) * <Y>))
		<sprite_props>
		<Flip>
	}
	<count> = (<count> + 1)
	<X> = (<X> + <width>)
	<column> = (<column> + 1)
	if (<X> > (<tile_dims> [0]))
		<X> = 0
		<Y> = (<Y> + <Height>)
		<row> = (<row> + 1)
		<column> = 0
		if (<Y> > (<tile_dims> [1]))
			return {Id = <container_id> count = <count>}
		endif
	endif
	repeat
endscript

script TileSpriteLoop \{move_x = 1 move_y = 0}
	getTags
	if gotParam \{flip_v}
		<width> = (<width> * 2)
	endif
	if gotParam \{flip_h}
		<Height> = (<Height> * 2)
	endif
	if ((<move_x> > <width>) || (<move_x> < (<width> * -1)))
		Printf \{"move_x is greater then the width of the image"}
		return
	endif
	if ((<move_y> > <Height>) || (<move_y> < (<Height> * -1)))
		Printf \{"move_y is greater then the height of the image"}
		return
	endif
	<X> = 0
	<Y> = 0
	begin
	<X> = (<X> + <move_x>)
	<Y> = (<Y> + <move_y>)
	if (<X> > <width>)
		<X> = (<X> - <width>)
		doMorph {
			pos = {((-1.0, 0.0) * <width>) Relative}
		}
	endif
	if (<X> < (<width> * -1))
		<X> = (<width> + <X>)
		doMorph {
			pos = {((1.0, 0.0) * <width>) Relative}
		}
	endif
	if (<Y> > <Height>)
		<Y> = (<Y> - <Height>)
		doMorph {
			pos = {((0.0, -1.0) * <Height>) Relative}
		}
	endif
	if (<Y> < (<Height> * -1))
		<Y> = (<Height> + <Y>)
		doMorph {
			pos = {((0.0, 1.0) * <Height>) Relative}
		}
	endif
	doMorph {
		pos = (((1.0, 0.0) * ((<pos> [0]) + <X>)) + ((0.0, 1.0) * ((<pos> [1]) + <Y>)))
		Time = 0.1
	}
	repeat
endscript
