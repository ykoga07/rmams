#' Define the FNG (feature neighborhood graph) S4 object
#' @title class FNG
#' @description Stores feature neighborhood graph data
#' @slot id character
#' @slot dataset_id character
#' @slot filepath character
#' @slot accessor character
#' @slot edge_metric character
#' @slot metric_type character
#' 
#' @return a FNG S4 object for use with MAMS
#' @export
#' @noRd

setClass(
  "FNG",
  slots = list(
    id = "CharOrNULL",
    dataset_id = "CharOrNULL",
    filepath = "CharOrNULL",
    accessor = "CharOrNULL",
    parent_id = "CharOrNULL",
    record_id = "CharOrNULL",
    edge_metric = "CharOrNULL",
    metric_type = "CharOrNULL"
  )
)

# Getter and setter functions 

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("id", "FNG", function(x) x@id)

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("id<-", "FNG", function(x, value) {
  x@id <- value
  x
})

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("dataset_id", "FNG", function(x) x@dataset_id)

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("dataset_id<-", "FNG", function(x, value) {
  x@dataset_id <- value
  x
})

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("filepath", "FNG", function(x) x@filepath)

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("filepath<-", "FNG", function(x, value) { x@filepath <- value; x })

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("accessor", "FNG", function(x) x@accessor)

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("accessor<-", "FNG", function(x, value) { x@accessor <- value; x })

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("parent_id", "FNG", function(x) x@parent_id)

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("parent_id<-", "FNG", function(x, value) {
  x@parent_id <- value
  x
})

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("record_id", "FNG", function(x) x@record_id)

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("record_id<-", "FNG", function(x, value) {
  x@record_id <- value
  x
})

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("edge_metric", "FNG", function(x) x@edge_metric)

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("edge_metric<-", "FNG", function(x, value) {
  x@edge_metric <- value
  x
})

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("metric_type", "FNG", function(x) x@metric_type)

#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("metric_type<-", "FNG", function(x, value) {
  x@metric_type <- value
  x
})

#' Constructor for the FNG (feature neighborhood graph) S4 object
#' @description Creates the FID object and populates its subfields
#' @param id Main ID of MAMS object
#' @param dataset_id Parent dataset ID
#' @param filepath Path to the data file
#' @param accessor Accessor
#' @param parent_id Parent FOM object
#' @param record_id Record ID
#' @param edge_metric Type of edge metric used
#' @param metric_type Details of the edge metric
#' 
#' @return a FNG S4 object for use with MAMS
#' @export

#Create object function 
create_FNG_object <- function(
    id = NA_character_,
    dataset_id = NA_character_,
    filepath = NA_character_,
    accessor = NA_character_,
    parent_id = NA_character_,
    record_id = NA_character_,
    edge_metric = NA_character_,
    metric_type = NA_character_
) {
  obj <- new("FNG",
             id = id,
             dataset_id = dataset_id,
             filepath = filepath,
             accessor = accessor,
             parent_id = parent_id,
             record_id = record_id,
             edge_metric = edge_metric,
             metric_type = metric_type
  )
  return(obj)
}

# collapse function to sub object
#' setMethod
#' @description getter/setter
#' @export
#' @noRd
setMethod("collapse_to_list", "FNG", function(x) {
  collapsed_list <- mapply(function(s) slot(x, s),
                           slotNames(x),
                           SIMPLIFY = FALSE)
  # Remove NULL values
  collapsed_list <- Filter(function(y) !is.null(y), collapsed_list)
  return(collapsed_list)
})
