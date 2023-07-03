require('lspconfig').yamlls.setup {                                                                                                     
    filetypes = { 'yaml', 'yml' },                                                                                         
    settings = {                                                                                                           
        yaml = {                                                                                                           
            hover = true,                                                                                                  
            format = {                                                                                                     
                enable = true,                                                                                             
                singleQuote = true,                                                                                        
            },                                                                                                             
            completion = true,                                                                                             
            validate = true,                                                                                               
            customTags = { '!Ref', '!ImportValue' },                                                                       
            schemas = {                                                                                                    
                'https://raw.githubusercontent.com/awslabs/goformation/v4.18.2/schema/cloudformation.schema.json: "/*"',   
            },                                                                                                             
            schemaStore = {                                                                                                
                enable = true,                                                                                             
            },                                                                                                             
        },                                                                                                                 
    }
}
