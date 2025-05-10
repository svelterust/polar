<script>
    const { name, items } = $props();
</script>

<h1 class="text-2xl font-semibold">Hello, {name}!</h1>
<ul class="list-disc pl-6 space-y-2 mt-4">
    {#each items as item}
        <li>{item}</li>
    {/each}
</ul>
