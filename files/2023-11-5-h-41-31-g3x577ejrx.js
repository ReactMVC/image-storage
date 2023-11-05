const { Api, TelegramClient } = require("telegram")
const { StringSession } = require("telegram/sessions")
const { NewMessage } = require("telegram/events")
const input = require("input") // npm i input
const moment = require("moment") // npm i moment
moment.locale("fa")
const apiId = 11693618
const apiHash = "ffb3c0502257e47d3729ae813ad5ba9b"
const stringSession = new StringSession(
	"1BAAOMTQ5LjE1NC4xNjcuOTEAUCGWuxeU/FIV0UvA7Rcl9yYeDzDSFmbDDGjUdTaZczM//c1jYhUUG4kRPqPaIHx7Mp5Spr/DX0fSOVr2GydTZNWJ2yMt2uFkp4q7BxqNwBVWzaFfROrH1dHCzTOnVVrNF8ZpQtE4KVTCICqFaHDWedUJkDQ2SiSiRY+nmuQHAKQIYIjHi3bbPDbjcXu9CRdCPC55I+NS8Kcytqf88Sts+iODBLsriUBZM13oVZNUdGGSYO1Y7+TqUxv/t0H9wA7Bqfd/kJfT8jD+tHnJ1H2rsinDa7TiKdYLjV/gc7UfgPA5nitYTLsQNkYs6zxPl0PM4IuITolGwoiFXCDba5fDWYI="
) // fill this later with the value from session.save()
const client = new TelegramClient(stringSession, apiId, apiHash, {
	connectionRetries: 5,
})
client.setParseMode("md")

const data = {}

async function eventPrint(event) {
	const message = event.message
	const sender = await message.getSender()
	const { id: msgId } = message
	await client.invoke(
		new Api.messages.SendMessage({
			peer: 19132245253,
			message: "PONG!",
		})
	)
	// Checks if it's a private message (from user or bot)
	if (message.text === "id" && sender.self) {
		const { value: chatId } = message.chat.id
		await client.invoke(
			new Api.messages.EditMessage({
				peer: chatId,
				id: message.id,
				message: `ID: ${chatId}`,
			})
		)
	}
	if (event.isPrivate) {
		if (message.text === "time" && sender.self) {
			data.timer = true
			data.interval = setInterval(async () => {
				let time = moment().format("LTS")
				data.msg = await client.editMessage("me", {
					message: msgId,
					text: time,
				})
			}, 1000)
		}
		if (message.text === "off" && sender.self) {
			if (data.timer) {
				data.timer = false
				clearInterval(data.interval)
				await client.editMessage("me", {
					message: data.msg.id,
					text: "no time found!",
				})
				await client.invoke(
					new Api.messages.DeleteMessages({
						id: [msgId],
						revoke: true,
					})
				)
			} else {
				await client.invoke(
					new Api.messages.EditMessage({
						peer: "me",
						id: msgId,
						message: "no times found!",
					})
				)
			}
		}
	}
}

;(async () => {
	console.log("Loading interactive example...")
	await client.start({
		phoneNumber: async () => await input.text("number ?"),
		password: async () => await input.text("password?"),
		phoneCode: async () => await input.text("Code ?"),
		onError: (err) => console.log(err),
	})
	console.log("You should now be connected.")
	// console.log(client.session.save()); // Save this string to avoid logging in again
	await client.sendMessage("me", { message: "Hello!\nim Online" })
	await client.sendMessage(19132245253, { message: "Hello!\nim Online" })
	// adds an event handler for new messages
	client.addEventHandler(eventPrint, new NewMessage({}))
})()
