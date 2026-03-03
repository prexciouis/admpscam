"use client";

export default function Home() {

  async function sendDiscordMessage() {
    await fetch("/api/discord", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        content: "Hello! This is a test message.",
      }),
    });
    alert("Message sent! Check Discord.");
  }

  return (
    <div>
      <button onClick={sendDiscordMessage}>
        Test Discord Webhook
      </button>
    </div>
  );
}
