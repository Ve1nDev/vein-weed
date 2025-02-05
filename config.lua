Ve1n = {}

Ve1n.OtPropu = "prop_weed_02"
Ve1n.OtItemAdi = "weed-bad-ql"
Ve1n.OtMin = 1
Ve1n.OtMax = 5

Ve1n.PaketlenmisOtItem = "package-weed-bad-ql"
Ve1n.PaketBasiUcret = 1000 -- 1 adet paketlenmiş ot satınca gelecek item yani cash karapara hangisiyse kaç adet verileceği
Ve1n.SatisDaGelenItem = "cash" -- cash , karapara , markedbills vb.


-- toplama yerleri not her bir cordinatta bir adet ot propu spawlanır

Ve1n.OtYerleri = {
    vector3(-124.68, 2802.3, 52.07),
    vector3(-123.6, 2804.64, 52.02), 
    vector3(-119.96, 2806.86, 52.99),
    vector3(-119.74, 2805.55, 52.99),
    vector3(-118.22, 2803.45, 52.03),
    vector3(-119.87, 2801.96, 52.08),
    -- 2
    vector3(1523.09, 1679.33, 109.16),
    vector3(1521.53, 1676.39, 109.3),
    vector3(1528.3, 1674.72, 109.08),
    vector3(1529.73, 1670.8, 109.14),
    vector3(1525.71, 1669.02, 110.5),
    vector3(1519.65, 1672.76, 110.67),
    vector3(1523.48, 1671.95, 110.43),
    -- 3
    vector3(-1940.88, 1784.23, 169.56),
    vector3(-1941.87, 1787.18, 172.4),
    vector3(-1936.65, 1789.16, 171.8),
    vector3(-1937.03, 1783.67, 172.42),
    vector3(-1937.27, 1786.18, 172.23),
    vector3(-1940.62, 1781.21, 172.87)
}

Ve1n.PaketlemeNpcModel = "a_m_m_mexlabor_01"
Ve1n.PaketlemeNpcYeri = vector3(-271.48, 2197.03, 128.83)
Ve1n.PaketlemeNpcYeriHeading = 160.0

Ve1n.SatisNpcModel = "a_m_m_indian_01"
Ve1n.SatisNpcKordinatlar  = vector3(68.08, 3684.27, 38.83) 
Ve1n.SatisNpcHeading = 50.0

Ve1n.Blips = {
    {
        label = "Ot Toplama 1",
        coords = vector3(-124.68, 2802.3, 53.07),
        sprite = 140,
        scale = 0.7,
        colour = 25
    },
    {
        label = "Ot Toplama 2",
        coords = vector3(1525.71, 1669.02, 110.5),
        sprite = 140,
        scale = 0.7,
        colour = 25
    },
    {
        label = "Ot Toplama 3",
        coords = vector3(-1937.27, 1786.18, 173.23),
        sprite = 140,
        scale = 0.7,
        colour = 25
    },
    {
        label = "Ot Paketleme",
        coords = vector3(-271.48, 2197.03, 128.83),
        sprite = 140,
        scale = 0.7,
        colour = 25
    },
    {
        label = "Ot Satış",
        coords = vector3(68.08, 3684.27, 39.83),
        sprite = 310,
        scale = 0.7,
        colour = 1
    },
}