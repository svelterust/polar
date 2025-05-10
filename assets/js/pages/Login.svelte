<script>
    import { useForm } from "@inertiajs/svelte";

    // Props
    const { name } = $props();

    // Form
    let form = useForm({
        email: null,
        password: null,
        remember: false,
    });

    function submit(event) {
        event.preventDefault();
        $form.post("/");
    }
</script>

<svelte:head>
    <title>Hello, {name}!</title>
</svelte:head>

<h1 class="text-xl font-semibold">Hello, {name}!</h1>

<form class="mt-4" onsubmit={submit}>
    <fieldset class="fieldset mb-4">
        <legend class="fieldset-legend">Email</legend>
        <input
            type="text"
            bind:value={$form.email}
            placeholder="Email"
            class="input w-full max-w-xs"
        />
        {#if $form.errors.email}
            <p class="label text-error">{$form.errors.email}</p>
        {/if}
    </fieldset>

    <fieldset class="fieldset mb-4">
        <legend class="fieldset-legend">Password</legend>
        <input
            type="password"
            bind:value={$form.password}
            placeholder="Password"
            class="input w-full max-w-xs"
        />
        {#if $form.errors.password}
            <p class="label text-error">{$form.errors.password}</p>
        {/if}
    </fieldset>

    <div class="form-control mb-4">
        <label class="label cursor-pointer justify-start gap-2">
            <input
                type="checkbox"
                bind:checked={$form.remember}
                class="checkbox checkbox-primary"
            />
            <span class="label-text">Remember Me</span>
        </label>
    </div>

    <button type="submit" class="btn btn-primary" disabled={$form.processing}>
        {#if $form.processing}
            <span class="loading loading-spinner loading-sm"></span>
        {/if}
        Submit
    </button>
</form>
