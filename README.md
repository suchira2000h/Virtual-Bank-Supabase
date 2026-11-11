# ADB Bank

1. Go to the **Actions** tab and select the latest Workflow.
2. Open the run and download **ADB-bank-apk** under *Artifacts*.
3. Unzip it and install `app-debug.apk` on your phone (allow "install unknown apps").

## Interest (v1.1)

- Your balance earns **10% APR**, credited **every day** (daily rate = 10% / 365, compounded daily).
- Interest is added at each midnight (local time). If the app was closed for a few days, the missed days are credited the next time you open it.
- Fractions of a cent are carried over, so small balances still earn correctly.
- Each credit shows in *Recent activity* as "Daily interest"; total earned is shown on the card.
- Existing accounts start earning from the day they update.

## Online backup with Supabase (v1.2)

Your account and transactions are saved to your own Supabase project, so they come back after reinstalling the app.

**One-time setup**

1. Create a free project at https://supabase.com.
2. Open **SQL Editor -> New query**, paste the contents of `supabase/schema.sql`, and click **Run**.
3. Open **Project Settings -> API** and copy the **Project URL** and the **anon public** key into `lib/config.dart`.
4. (Optional, easier sign-up) **Authentication -> Providers -> Email -> turn off "Confirm email"**. Otherwise you must click a confirmation link in your email after creating a login.
5. Push to GitHub and download the new APK from Actions as before.

**Using it**

- First launch: create a login (email + password). After reinstalling, just sign in and your balance and history are restored.
- A cloud icon in the top bar shows whether everything is saved online. If you are offline, changes are kept on the phone and uploaded automatically later.
- An account created in v1.0/v1.1 on this phone is uploaded the first time you sign in.
- If `lib/config.dart` is left unfilled, the app still works offline only, with no login.
