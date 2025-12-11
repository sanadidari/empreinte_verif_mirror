import { createClient } from "@supabase/supabase-js";

export const config = { runtime: "edge" };

export default async function handler(req: Request) {
  try {
    const body = await req.json().catch(() => null);

    if (!body?.token) {
      return new Response(
        JSON.stringify({ success: false, message: "Token manquant" }),
        { status: 400 }
      );
    }

    // ✔ Sécurisé : ANON KEY uniquement
    const supabase = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
    );

    const { data, error } = await supabase
      .from("employees")
      .select("id, name")
      .eq("token", body.token)
      .single();

    if (error || !data) {
      return new Response(
        JSON.stringify({ success: false, message: "Employé introuvable" }),
        { status: 404 }
      );
    }

    return new Response(
      JSON.stringify({ success: true, employee: data }),
      { status: 200 }
    );
  } catch (err: any) {
    return new Response(
      JSON.stringify({
        success: false,
        message: "Erreur interne du serveur",
        error: err?.message,
      }),
      { status: 500 }
    );
  }
}
