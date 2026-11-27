abstract class Constants {
  static final List<String> customers = [
    "Ramesh Furniture",
    "Urban Interiors",
    "Sai Wood Works",
    "Green Home Designs",
    "Classic Modular Kitchen",
    "Royal Furnishings",
    "WoodCraft Studio",
    "Elite Interior Solutions",
    "Modern Space Decor",
    "Shree Balaji Furniture",
  ];

  static final List<String> projects = [
    "Modular Kitchen – Block A",
    "Wardrobe – Master Bedroom",
    "TV Unit – Living Room",
    "Office Workstation",
    "Bedroom Storage Unit",
    "Kitchen Cabinets – Phase 2",
    "Retail Display Racks",
    "Hotel Room Furniture",
    "Study Table & Shelves",
    "Bathroom Vanity Unit",
  ];
  static final List<String> orderStatus = [
    "Pending",
    "Confirmed",
    "In Progress",
    "Cutting In Progress",
    "Edge Banding In Progress",
    "Multiboring In Progress",
    "Packaging",
    "Ready For Dispatch",
    "Dispatched",
    "Delivered",
    "Cancelled",
  ];
  static final List<String> orderNames = [
    "Kitchen Cabinet Order",
    "Wardrobe Panel Order",
    "Living Room TV Unit Order",
    "Bedroom Furniture Order",
    "Office Workstation Order",
    "Modular Kitchen Phase 1",
    "Modular Kitchen Phase 2",
    "Master Bedroom Wardrobe",
    "Kids Room Storage Unit",
    "Bathroom Vanity Unit",
  ];

  static final List<String> materials = [
    "18mm Green Ply OSL Fabric + White",
    "18mm Green Ply OSL Fabric + Grey",
    "18mm Green Ply OSL Matte Finish",
    "25mm Green Ply OSL Fabric + White",
    "25mm Green Ply OSL Fabric + Walnut",
    "30mm Green Ply OSL High Gloss White",
    "42mm Green Ply OSL Fabric + White",
    "42mm Green Ply OSL Fabric + Ivory",
    "18mm Century Ply MR Grade White",
    "18mm Century Ply BWP Grade Grey",
    "25mm Century Ply BWP Grade Teak",
    "18mm Action Tesa Board Pre-Laminated White",
    "18mm Action Tesa Board Pre-Laminated Walnut",
    "25mm Action Tesa Board Pre-Laminated Grey",
    "18mm MDF Board Matte White",
    "25mm MDF Board High Gloss White",
    "18mm HDHMR Board Frosty White",
    "25mm HDHMR Board Oak Finish",
  ];
  static final List<String> cutStatus = [
    "Pending",
    "In Progress",
    "Completed",
    "Cancelled",
  ];
  static final List<String> shipmentStatus = [
    "PENDING",
    "CUTTING_COMPLETED",
    "READY_FOR_DISPATCH",
    "DISPATCHED",
    "IN_TRANSIT",
    "OUT_FOR_DELIVERY",
    "DELIVERED",
    "CANCELLED",
  ];

  static final List<String> inventoryStatus = [
    "AVAILABLE",
    "RESERVED",
    "USED",
    "SCRAP",
  ];
  static final List<String> allocationStrategy = [
    'AUTO', // system decides
    'OFFCUT_ONLY', // use only offcuts
    'FULL_SHEET_ONLY', // ignore offcuts
    //'OFFCUT_PRIORITY', // offcuts first, then full
    //'MIN_WASTE', // choose layout with least waste
  ];
  static final List<String> userStatus = ["ACTIVE", "INACTIVE", "SUSPENDED"];
  static final List<String> inventoryType = [
    "SHEET",
    "HARDWARE",
    "EDGE_BAND",
    "CONSUMABLE",
  ];

  static final List<String> options = ["Yes", "No"];
}
