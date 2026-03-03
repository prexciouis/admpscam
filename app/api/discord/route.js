
export async function POST(request) {
    const DISCORD_WEBHOOK = process.env.DISCORD_WEBHOOK_URL;

    if (!DISCORD_WEBHOOK) {
        return new Response(
            JSON.stringify({ error: "Webhook not configured" }),
            { status: 500 }
        );
    }

    try {
        const body = await request.json();

        await fetch(DISCORD_WEBHOOK, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(body),
        });

        return new Response(
            JSON.stringify({ success: true }),
            { status: 200 }
        );
    } catch (err) {
        return new Response(
            JSON.stringify({ error: err.message }),
            { status: 500 }
        );
    }
}