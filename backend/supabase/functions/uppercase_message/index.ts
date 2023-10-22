// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2.22.0?target=deno";

const supabaseClient = createClient(
  Deno.env.get("SUPABASE_URL") ?? "",
  Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "",
  {
    global: {
      headers: {
        Authorization: "Bearer " + Deno.env.get("SUPABASE_SERVICE_ROLE_KEY"),
        "Access-Control-Allow-Origin": "*",
      },
    },
  },
);

export const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

const createApiResponse = (statusCode: number, body: { message: string }) => {
  const headers = { ...corsHeaders, "Content-Type": "application/json" };
  return new Response(JSON.stringify(body), { headers, status: statusCode });
};

serve(async (req) => {
  // Required for web browsers
  if (req.method === "OPTIONS") {
    return createApiResponse(200, { message: "ok" });
  }

  const { id } = await req.json();
  const { data: messages, error: getBodyError } = await supabaseClient.from(
    "messages",
  ).select("body").eq("id", id);

  if (getBodyError != null || !messages || messages.length !== 1) {
    return createApiResponse(400, { message: "Error getting message" });
  }

  const capitalizedBody = messages[0].body.toUpperCase();
  const { error: updateMessageError } = await supabaseClient.from("messages")
    .update({ body: capitalizedBody }).eq("id", id);

  if (updateMessageError != null) {
    return createApiResponse(500, { message: "Error updating message" });
  }

  return createApiResponse(200, { "message": "Success" });
});
