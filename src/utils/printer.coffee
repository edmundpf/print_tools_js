chalk = require 'chalk'
box = require 'boxen'
emoji = require 'node-emoji'
dateFormat = require 'dateformat'

#: Print Class

Print =

	#: Success method

	success: (text, args={ dec: 'none', indent: 0, offset: 1, log: true, emoji: true, ret: false }) ->
		return printPreset(this, text, '✔', 'blush', 1, args)

	#: Info method

	info: (text, args={ dec: 'none', indent: 0, offset: 0, log: true, emoji: true, ret: false }) ->
		return printPreset(this, text, 'ℹ', 'thinking_face', 0, args)

	#: Warning method

	warning: (text, args={ dec: 'none', indent: 0, offset: 1, log: true, emoji: true, ret: false }) ->
		return printPreset(this, text, "⚠ #{chalk.bgYellow(' Warning ')}", 'sweat', 1, args)

	#: Error method

	error: (text, args={ dec: 'none', indent: 0, offset: 0, log: true, emoji: true, ret: false }) ->
		return printPreset(this, text, "💀 #{chalk.bgRed(' ERROR ')}", 'fearful', 0, args)

	#: Arrow method

	arrow: (text, args={indent: 0, log: true, ret: false }) ->
		return printDecoration(this, text, '-->', args)

	#: Chevron method

	chevron: (text, args={ indent: 0, log: true, ret: false }) ->
		return printDecoration(this, text, '>>>', args)

	#: Bullet method

	bullet: (text, args={ indent: 0, log: true, ret: false }) ->
		return printDecoration(this, text, '•', args)

	#: Log method

	log: (text, args={ ret: false, emoji: false, offset: 0 }) ->

		if !args.ret?
			args.ret = false
		if !args.offset?
			args.offset = 0
		if !args.emoji?
			args.emoji = false

		emote = getEmote(args.emoji)
		cols = process.stdout.columns
		time = dateFormat(new Date(), 'HH:MM:ss')
		space = ' '.repeat(cols - text.replace(/\u001b\[.*?m/g, '').length - emote.length - time.length - 1 - args.offset)
		output = "#{text}#{space}#{emote} #{time}"
		return logOrReturn(output, args.ret)

	#: Title Box

	titleBox: (title, args={ theme: 'main', themeDesc: null, tagLine: null, author: null, email: null, ret: false }) ->
		themeAliases =
			main: 'cyan'
			success: 'green'
			info: 'blue'
			warning: 'yellow'
			danger: 'red'

		if !args.theme?
			args.theme = 'main'
		if themeAliases[args.theme]?
			args.theme = themeAliases[args.theme]
		if !Object.values(themeAliases).includes(args.theme)
			args.theme = themeAliases['main']

		boxLines = []

		if !args.titleDesc?
			boxLines.push(title)
		else
			boxLines.push(chalk"{#{theme} #{title}}: #{args.titleDesc}")
		if args.tagLine?
			boxLines.push("#{chalk.gray(args.tagLine)}\n")
		if args.author? and args.email?
			boxLines.push(chalk"#{args.author}: {yellow #{args.email}}")
		else if args.author? and !args.email?
			boxLines.push(args.author)
		else if !args.author? and args.email?
			boxLines.push(chalk.yellow(args.email))

		boxStr = box(
			boxLines.join('\n'),
			{
				padding: 1
				margin: 1
				borderStyle: 'round'
				borderColor: args.theme
			}
		)

		if !args.ret? or !args.ret
			console.log boxStr
			return true
		else if args.ret
			return boxStr

#: Print Decoration

printDecoration = (obj, text, decText, args) ->
	args = decArgs(args)
	output = dec(text, decText, args.indent)
	if args.log
		return obj.log(output, { ret: args.ret })
	else
		return logOrReturn(output, args.ret)

#: Print Preset

printPreset = (obj, text, presetText, emojiText, defaultOffset, args) ->
	args = presetArgs(args, defaultOffset)

	output = "#{presetText} #{text}"

	styleMethods =
		arrow: obj.arrow
		chevron: obj.chevron
		bullet: obj.bullet

	if styleMethods[args.dec]?
		output = styleMethods[args.dec](output, {
			indent: 0
			log: false
			ret: true
		})

	output = "#{'    '.repeat(args.indent)}#{output}"

	if args.log
		if args.emoji
			emote = emojiText
		else
			emote = false
		return obj.log(output, { ret: args.ret, emoji: emote, offset: args.offset })

	else
		emote = getEmote(emojiText, args.emoji)
		cols = process.stdout.columns
		space = ' '.repeat(cols - output.replace(/\u001b\[.*?m/g, '').length - emote.length - args.offset)
		output = "#{output}#{space}#{emote}"
		return logOrReturn(output, args.ret)

#: Decoration Args

decArgs = (obj) ->
	def =
		indent: 0
		log: true
		ret: false
	return {...def, ...obj}

#: Preset Args

presetArgs = (obj, defaultOffset) ->
	def =
		dec: 'none'
		indent: 0
		offset: defaultOffset
		log: true
		emoji: true
		ret: false
	return {...def, ...obj}

#: Get Emote

getEmote = (emoticon, emoteCheck) ->
	if !emoteCheck?
		emoteCheck = emoticon
	if emoteCheck != false
		emote = emoji.find(emoticon)
		if !emote?
			emote = ' '
		else
			emote = emote.emoji
	else
		emote = ' '
	return emote

#: Log or Return

logOrReturn = (text, ret) ->
	if !ret
		console.log text
		return true
	else
		return text

#: Decoration Print

dec = (text, decText='', indent=0) ->
	return "#{'    '.repeat(indent)}#{decText} #{text}"

#: Exports

module.exports = Print

#::: End Program:::