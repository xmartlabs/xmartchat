// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts"
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.22.0?target=deno";

const supabaseClient = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
  {
    global: {
      headers: {
        Authorization: "Bearer " + Deno.env.get("SUPABASE_SERVICE_ROLE_KEY"),
      },
    },
  },
);

serve(async (req) => {
  const { id } = await req.json()

  const { data, error: get_body_error } = await supabaseClient.from("messages").select("body").eq("id", id)

  if (get_body_error != null) {
    return new Response(JSON.stringify({ "message": "Error getting message body" }), { headers: { "Content-Type": "application/json" } },)
  }

  const body = data[0].body

  const capitalizedMessage = body.toUpperCase()

  const { error } = await supabaseClient.from("messages").update({ body: capitalizedMessage }).eq("id", id)

  if (error != null) {
    return new Response(JSON.stringify({ "message": "Error updating message" }), { headers: { "Content-Type": "application/json" } },)
  }


  return new Response(
    JSON.stringify({ "message": "Success" }),
    { headers: { "Content-Type": "application/json" } },
  )
})
