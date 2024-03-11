import { logger } from "https://deno.land/x/hono@v4.1.0/middleware.ts";
import { Hono } from "https://deno.land/x/hono@v4.1.0/mod.ts";

const app = new Hono();

app.use("*", logger());

app.post("/prelogin", async (c) => {
  if (c.req.query("protocol") === "OIDC") {
    const payload = await c.req.json();

    const username = payload.username;
    const groups = payload.oidc_custom_fields.groups.map((g: string) => ({
      name: g.slice(1).replace("discord-", ""),
      type: 2,
    }));

    const user = {
      status: 1,
      username,
      groups,
      permissions: {
        "/": ["list"],
      },
    };
    console.log("oidc", user);

    return c.json(user);
  } else {
    return c.json({ status: 1 });
  }
});

Deno.serve(app.fetch);
