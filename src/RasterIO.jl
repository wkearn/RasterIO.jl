module RasterIO

    const libgdal = "libgdal"

    export Raster
        
        # High-level API functions
        # open_raster, copy_raster, write_raster,
        # Utility functions
        # driver_list, driver_test, check_create,
        # Other useful functions
        # gdal_translate,
        # Constants
        #GDT_Unknown, GDT_Byte, GDT_UInt16, GDT_Int16, GDT_UInt32, GDT_Int32, GDT_Float32, GDT_Float64,
        #GA_ReadOnly, GA_Update,
        #GF_Read, GF_Write

    include("gdal_cdefs.jl")
    include("gdal_cfuns.jl")
    include("gdal_functions.jl")
    include("raster_types.jl")
    include("raster_functions.jl")

    GDALAllRegister() # register all known drivers

    # function check_create(drivername::ASCIIString,copy::Int=0)
    #     driver = GDALGetDriverByName(pointer(drivername))
    #     if copy == 1
    #         createcopy = GDALGetMetadataItem(driver,pointer("DCAP_CREATECOPY"),Ptr{UInt8}(C_NULL))
    #         check = createcopy == C_NULL ? false : true
    #     else
    #         create = GDALGetMetadataItem(driver,pointer("DCAP_CREATE"),Ptr{UInt8}(C_NULL))
    #         check = create == C_NULL ? false : true
    #     end
    #     return check
    # end

    # ## Useful little functions

    # function gdal_translate(source::ASCIIString,destination::ASCIIString,dstdriver::ASCIIString)
    #     raster = open_raster(source,Int(GA_ReadOnly))
    #     write_raster(raster,destination,dstdriver,eval(parse(string("GDT_",eltype(raster.data)))))
    # end

end
