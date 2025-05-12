<script lang="ts">
    import { useForm, router } from "@inertiajs/svelte";

    // Types
    type Item = {
        id: number;
        title: string;
        description?: string;
        inserted_at: string;
    };

    type Props = {
        items: Item[];
    };

    const { items }: Props = $props();

    // Form
    const form = useForm({
        title: "",
        description: "",
    });

    function createItem(event: Event) {
        event.preventDefault();
        $form.post("/", { onSuccess: () => $form.reset() });
    }

    function deleteItem(id: number) {
        router.visit(`/${id}`, {
            method: "delete",
            preserveScroll: true,
        });
    }

    function formatDate(dateString: string) {
        const date = new Date(dateString);
        return date.toLocaleDateString("en-US", {
            year: "numeric",
            month: "long",
            day: "numeric",
        });
    }
</script>

<h1 class="mb-2 text-3xl font-bold">Create Item</h1>
<div class="mb-8 max-w-screen-sm">
    <form onsubmit={createItem}>
        <div class="form-control mb-4">
            <span class="label-text">Title</span>
            <input type="text" id="title" bind:value={$form.title} class="input input-bordered mt-2 w-full" />
            {#if $form.errors.title}
                <div class="text-error mt-1 text-sm">{$form.errors.title}</div>
            {/if}
        </div>

        <div class="form-control mb-4">
            <span class="label-text mb-2">Description</span>
            <textarea
                id="description"
                bind:value={$form.description}
                class="textarea textarea-bordered mt-2 w-full"
                rows="4"
            ></textarea>
            {#if $form.errors.description}
                <div class="text-error mt-1 text-sm">{$form.errors.description}</div>
            {/if}
        </div>

        <button type="submit" disabled={$form.processing} class="btn btn-primary">
            {#if $form.processing}
                <span class="loading loading-spinner"></span>
            {/if}
            {$form.processing ? "Submitting..." : "Create Item"}
        </button>
    </form>
</div>

<h2 class="mb-2 text-2xl font-bold">Items</h2>
<div class="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3">
    {#if items.length > 0}
        {#each items as item}
            <div class="card border border-slate-300 transition duration-200">
                <div class="card-body">
                    <div class="flex items-center gap-2">
                        <h2 class="card-title">{item.title}</h2>
                        <div class="badge badge-info">
                            {formatDate(item.inserted_at)}
                        </div>
                    </div>
                    {#if item.description}
                        <p>{item.description}</p>
                    {/if}
                    <button class="btn btn-remove" onclick={() => deleteItem(item.id)}>
                        <span class="i-lucide-trash"></span>
                        Delete Item
                    </button>
                </div>
            </div>
        {/each}
    {:else}
        <div class="alert alert-info col-span-full">
            <span class="i-lucide-info h-6 w-6 shrink-0"></span>
            <span>No items available.</span>
        </div>
    {/if}
</div>
