
table.insert (default_access.rules,{
    matches = {
        {
            { "application.process.binary", "=", "vesktop" }
        }
    },
    default_permissions = "rx",
})


