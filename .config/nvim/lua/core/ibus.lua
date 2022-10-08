-- Fix ibus
require('ibus').setup({
    ibus_engine_normal_mode = 'BambooUs::Candy',
    ibus_engine_insert_mode = 'Bamboo::Candy',
    ibus_engine_auto_mode = false,
})

