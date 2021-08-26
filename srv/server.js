const cds = require('@sap/cds')
module.exports = cds.server

if (process.env.NODE_ENV !== 'production') {
    const cds_swagger = require('cds-swagger-ui-express')
    cds.on('bootstrap', app => app.use(cds_swagger(
        {
            "basePath": "/$api-docs", // the root path to mount the middleware on
            "diagram": "true" // whether to render the YUML diagram
        }

    )))
}
