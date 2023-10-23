# Supabase Edge Functions Example

This template demonstrates how to run a [Supabase Edge Functions](https://supabase.com/docs/guides/functions) application via Dart Edge.

## Getting Started

Install the dependencies:

```bash
dart pub get
```

Start the application via Dart Edge CLU & the [`supabase` CLI](https://supabase.com/docs/guides/cli):

```bash
supabase init
fvm dart run edge build supabase_functions
supabase functions serve dart_edge
```

For more information, see the [Dart Edge documentation](https://docs.dartedge.dev).