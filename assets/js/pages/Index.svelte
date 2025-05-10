<script>
    import { useForm } from "@inertiajs/svelte";

    // Props
    const { name, items } = $props();

    // Form
    let form = useForm({
        name: "",
        email: "",
    });
</script>

<svelte:head>
    <title>Hello, {name}!</title>
    <meta name="description" content="Page for {name} with their items" />
</svelte:head>

<h1 class="text-2xl font-semibold">Hello, {name}!</h1>
<ul class="list-disc pl-6 space-y-2 mt-4">
    {#each items as item}
        <li>{item}</li>
    {/each}
</ul>
