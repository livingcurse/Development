local warn = warn
local print = print
local error = error
local assert = assert
local pcall = pcall
local ipairs = ipairs
local pairs = pairs
local tostring = tostring
local loadstring = loadstring
local string_lower = string.lower
local string_find = string.find
local string_match = string.match
local string_upper = string.upper
local string_sub = string.sub
local string_rep = string.rep
local task_wait = task.wait
local task_spawn = task.spawn
local task_delay = task.delay
local CFrame_new = CFrame.new
local Vector3_zero = Vector3.zero
local Vector3_new = Vector3.new
local workspace = workspace

local cloneref = cloneref or clonereference or clone_ref or clone_reference
local gethui = gethui or get_hui or gethiddengui or get_hidden_gui or get_hidden_ui
local getidentity = getidentity or getthreadidentity or get_thread_identity or getthreadcontext or get_thread_context or syn.get_thread_identity
local setidentity = setidentity or setthreadidentity or set_thread_identity or setthreadcontext or set_thread_context or syn.set_thread_identity
local getconnections = getconnections or get_signal_cons or get_connections
local firesignal = firesignal or fire_signal
local getcustomasset = getcustomasset or getsynasset or get_custom_asset or get_syn_asset
local newcclosure = newcclosure or makecclosure or make_cclosure or new_c_closure or make_c_closure or newcc
local checkcaller = checkcaller or check_caller
local isfile = isfile or is_file
local isfolder = isfolder or is_folder
local readfile = readfile or read_file
local writefile = writefile or write_file
local appendfile = appendfile or append_file
local makefolder = makefolder or make_folder or createfolder or create_folder
local request = request or http_request or http.request or syn.request or Fluxus.request
local setclipboard = setclipboard or toclipboard or set_clipboard or to_clipboard or syn.write_clipboard
local getgc = getgc or get_gc_objects or debug.getgc

assert(cloneref, 'exploit missing cloneref')
assert(getidentity, 'exploit missing getidentity')
assert(setidentity, 'exploit missing setidentity')
assert(gethui, 'exploit missing gethui')
assert(request, 'exploit missing request')
assert(isfile, 'exploit missing isfile')
assert(readfile, 'exploit missing readfile')
assert(writefile, 'exploit missing writefile')
assert(makefolder, 'exploit missing makefolder')
assert(isfolder, 'exploit missing isfolder')

local players = cloneref(game:GetService("Players"))
local runServ = cloneref(game:GetService("RunService"))
local httpServ = cloneref(game:GetService("HttpService"))

if not IB_OBFUSCATED then
    IB_NO_VIRTUALIZE = function(f) return f end
    IB_ENCSTR = function(s) return s end
    IB_ENCFUNC = function(f) return f end
    IB_CRASH = function() end
    IB_LINE = 1
end

local players = cloneref(game:GetService("Players"))
local runServ = cloneref(game:GetService("RunService"))
local httpServ = cloneref(game:GetService("HttpService"))

local folder = "TrueOrFalseSolver"
local utils = (function()
    local utils = {}
    function utils.cleanText(text)
        if not text then return "" end
        local cleaned = text
        cleaned = string.gsub(cleaned, "<[^>]+>", "")
        cleaned = string.gsub(cleaned, "’", "'")
        cleaned = string.gsub(cleaned, "^%s*(.-)%s*$", "%1")
        return cleaned  
    end
    return utils
end)()

local network = (function()
    local network = {}
    function network.coolrequest(url)
        local zov = {
            {
                name = 'game:HttpGet',
                func = function(u) return game:HttpGet(u) end
            },
            {
                name = 'request',
                func = function(u) 
                    if request then
                        return request({Url = u, Method = 'GET'}).Body
                    end
                    warn('Executor does not support request/http_request')
                end
            }
        }
        for _, v in ipairs(zov) do
            local s, src = pcall(v.func, url)
            if s and src then return src end
        end
        return nil
    end
    return network
end)()

local flagSolver = (function()
    local m = {}
    local fags = {
        ["afghanistan"] = "🇦🇫", ["albania"] = "🇦🇱", ["algeria"] = "🇩🇿", ["andorra"] = "🇦🇩", ["angola"] = "🇦🇴",
        ["argentina"] = "🇦🇷", ["armenia"] = "🇦🇲", ["australia"] = "🇦🇺", ["austria"] = "🇦🇹", ["azerbaijan"] = "🇦🇿",
        ["bahamas"] = "🇧🇸", ["bahrain"] = "🇧🇭", ["bangladesh"] = "🇧🇩", ["barbados"] = "🇧🇧", ["belarus"] = "🇧🇾",
        ["belgium"] = "🇧🇪", ["belize"] = "🇧🇿", ["benin"] = "🇧🇯", ["bhutan"] = "🇧🇹", ["bolivia"] = "🇧🇴",
        ["bosnia"] = "🇧🇦", ["bosnia and herzegovina"] = "🇧🇦", ["botswana"] = "🇧🇼", ["brazil"] = "🇧🇷", ["brunei"] = "🇧🇳",
        ["bulgaria"] = "🇧🇬", ["burkina faso"] = "🇧🇫", ["burundi"] = "🇧🇮", ["cambodia"] = "🇰🇭", ["cameroon"] = "🇨🇲",
        ["canada"] = "🇨🇦", ["cape verde"] = "🇨🇻", ["central african republic"] = "🇨🇫", ["chad"] = "🇹🇩", ["chile"] = "🇨🇱",
        ["china"] = "🇨🇳", ["colombia"] = "🇨🇴", ["comoros"] = "🇰🇲", ["congo"] = "🇨🇬", ["costa rica"] = "🇨🇷",
        ["croatia"] = "🇭🇷", ["cuba"] = "🇨🇺", ["cyprus"] = "🇨🇾", ["czech republic"] = "🇨🇿", ["czechia"] = "🇨🇿",
        ["denmark"] = "🇩🇰", ["djibouti"] = "🇩🇯", ["dominica"] = "🇩🇲", ["dominican republic"] = "🇩🇴", ["ecuador"] = "🇪🇨",
        ["egypt"] = "🇪🇬", ["el salvador"] = "🇸🇻", ["equatorial guinea"] = "🇬🇶", ["eritrea"] = "🇪🇷", ["estonia"] = "🇪🇪",
        ["eswatini"] = "🇸🇿", ["ethiopia"] = "🇪🇹", ["fiji"] = "🇫🇯", ["finland"] = "🇫🇮", ["france"] = "🇫🇷",
        ["gabon"] = "🇬🇦", ["gambia"] = "🇬🇲", ["georgia"] = "🇬🇪", ["germany"] = "🇩🇪", ["ghana"] = "🇬🇭",
        ["greece"] = "🇬🇷", ["grenada"] = "🇬🇩", ["guatemala"] = "🇬🇹", ["guinea"] = "🇬🇳", ["guinea-bissau"] = "🇬🇼",
        ["guyana"] = "🇬🇾", ["haiti"] = "🇭🇹", ["honduras"] = "🇭🇳", ["hungary"] = "🇭🇺", ["iceland"] = "🇮🇸",
        ["india"] = "🇮🇳", ["indonesia"] = "🇮🇩", ["iran"] = "🇮🇷", ["iraq"] = "🇮🇶", ["ireland"] = "🇮🇪",
        ["israel"] = "🇮🇱", ["italy"] = "🇮🇹", ["ivory coast"] = "🇨🇮", ["jamaica"] = "🇯🇲", ["japan"] = "🇯🇵",
        ["jordan"] = "🇯🇴", ["kazakhstan"] = "🇰🇿", ["kenya"] = "🇰🇪", ["kiribati"] = "🇰🇮", ["kosovo"] = "🇽🇰",
        ["kuwait"] = "🇰🇼", ["kyrgyzstan"] = "🇰🇬", ["laos"] = "🇱🇦", ["latvia"] = "🇱🇻", ["lebanon"] = "🇱🇧",
        ["lesotho"] = "🇱🇸", ["liberia"] = "🇱🇷", ["libya"] = "🇱🇾", ["liechtenstein"] = "🇱🇮", ["lithuania"] = "🇱🇹",
        ["luxembourg"] = "🇱🇺", ["madagascar"] = "🇲🇬", ["malawi"] = "🇲🇼", ["malaysia"] = "🇲🇾", ["maldives"] = "🇲🇻",
        ["mali"] = "🇲🇱", ["malta"] = "🇲🇹", ["marshall islands"] = "🇲🇭", ["mauritania"] = "🇲🇷", ["mauritius"] = "🇲🇺",
        ["mexico"] = "🇲🇽", ["micronesia"] = "🇫🇲", ["moldova"] = "🇲🇩", ["monaco"] = "🇲🇨", ["mongolia"] = "🇲🇳",
        ["montenegro"] = "🇲🇪", ["morocco"] = "🇲🇦", ["mozambique"] = "🇲🇿", ["myanmar"] = "🇲🇲", ["namibia"] = "🇳🇦",
        ["nauru"] = "🇳🇷", ["nepal"] = "🇳🇵", ["netherlands"] = "🇳🇱", ["new zealand"] = "🇳🇿", ["nicaragua"] = "🇳🇮",
        ["niger"] = "🇳🇪", ["nigeria"] = "🇳🇬", ["north korea"] = "🇰🇵", ["north macedonia"] = "🇲🇰", ["norway"] = "🇳🇴",
        ["oman"] = "🇴🇲", ["pakistan"] = "🇵🇰", ["palau"] = "🇵🇼", ["palestine"] = "🇵🇸", ["panama"] = "🇵🇦",
        ["papua new guinea"] = "🇵🇬", ["paraguay"] = "🇵🇾", ["peru"] = "🇵🇪", ["philippines"] = "🇵🇭", ["poland"] = "🇵🇱",
        ["portugal"] = "🇵🇹", ["qatar"] = "🇶🇦", ["romania"] = "🇷🇴", ["russia"] = "🇷🇺", ["rwanda"] = "🇷🇼",
        ["saint kitts and nevis"] = "🇰🇳", ["saint lucia"] = "🇱🇨", ["saint vincent"] = "🇻🇨", ["samoa"] = "🇼🇸",
        ["san marino"] = "🇸🇲", ["sao tome and principe"] = "🇸🇹", ["saudi arabia"] = "🇸🇦", ["senegal"] = "🇸🇳",
        ["serbia"] = "🇷🇸", ["seychelles"] = "🇸🇨", ["sierra leone"] = "🇸🇱", ["singapore"] = "🇸🇬", ["slovakia"] = "🇸🇰",
        ["slovenia"] = "🇸🇮", ["solomon islands"] = "🇸🇧", ["somalia"] = "🇸🇴", ["south africa"] = "🇿🇦", ["south korea"] = "🇰🇷",
        ["south sudan"] = "🇸🇸", ["spain"] = "🇪🇸", ["sri lanka"] = "🇱🇰", ["sudan"] = "🇸🇩", ["suriname"] = "🇸🇷",
        ["sweden"] = "🇸🇪", ["switzerland"] = "🇨🇭", ["syria"] = "🇸🇾", ["taiwan"] = "🇹🇼", ["tajikistan"] = "🇹🇯",
        ["tanzania"] = "🇹🇿", ["thailand"] = "🇹🇭", ["timor-leste"] = "🇹🇱", ["togo"] = "🇹🇬", ["tonga"] = "🇹🇴",
        ["trinidad and tobago"] = "🇹🇹", ["tunisia"] = "🇹🇳", ["turkey"] = "🇹🇷", ["turkmenistan"] = "🇹🇲",
        ["tuvalu"] = "🇹🇻", ["uganda"] = "🇺🇬", ["ukraine"] = "🇺🇦", ["united arab emirates"] = "🇦🇪", ["uae"] = "🇦🇪",
        ["united kingdom"] = "🇬🇧", ["uk"] = "🇬🇧", ["united states"] = "🇺🇸", ["usa"] = "🇺🇸", ["uruguay"] = "🇺🇾",
        ["uzbekistan"] = "🇺🇿", ["vanuatu"] = "🇻🇺", ["vatican"] = "🇻🇦", ["venezuela"] = "🇻🇪", ["vietnam"] = "🇻🇳",
        ["yemen"] = "🇾🇪", ["zambia"] = "🇿🇲", ["zimbabwe"] = "🇿🇼",
    }
    function m.solve(text)
        local lower = string.lower(text)
        local country, emoji = string.match(lower, "^(.+) is this flag:%s*(.+)$")
        if not country or not emoji then return nil end
        country = string.gsub(country, "^%s*(.-)%s*$", "%1")
        emoji = string.gsub(emoji, "^%s*(.-)%s*$", "%1")
        local c = fags[country]    
        return emoji == c
    end
    return m
end)()

local mathSolver = (function()
    local solver = {}
    
    local function eval(expr)
        if string.match(expr, "[^0-9%.%+%-%*/%s%(%)%^]") then return nil end
        local success, res = pcall(loadstring("return " .. expr))
        if success then return res end
        return nil
    end

    function solver.solve(q)
        local text = string.lower(q)
        
        text = string.gsub(text, "%.+$", "")
        text = string.gsub(text, "x", "*")
        text = string.gsub(text, "X", "*")
        text = string.gsub(text, ":", "/")
        text = string.gsub(text, "÷", "/")
        text = string.gsub(text, "×", "*")
        text = string.gsub(text, "−", "-")
        text = string.gsub(text, "＝", "=")
        text = string.gsub(text, "\n", " ")
        text = string.gsub(text, " is the same as ", "=")

        if string.find(text, " is bigger than ") or string.find(text, " is greater than ") then
            local lhs, rhs = string.match(text, "^%s*(.-)%s*is %w+ than%s*(.-)%s*$")
            if lhs and rhs then
                local lhsv = eval(lhs)
                local rhsv = eval(rhs)
                if type(lhsv) == "number" and type(rhsv) == "number" then
                    return lhsv > rhsv
                end
            end
        end

        if string.find(text, " is lesser than ") or string.find(text, " is less than ") or string.find(text, " is smaller than ") then
            local lhs, rhs = string.match(text, "^%s*(.-)%s*is %w+ than%s*(.-)%s*$")
            if lhs and rhs then
                local lhsv = eval(lhs)
                local rhsv = eval(rhs)
                if type(lhsv) == "number" and type(rhsv) == "number" then
                    return lhsv < rhsv
                end
            end
        end
        
        local lhs, rhs = string.match(text, "^%s*(.-)%s*=%s*(.-)%s*$")
        if lhs and rhs then
            local lhsv = eval(lhs)
            local rhsv = eval(rhs)
            
            if type(lhsv) == "number" and type(rhsv) == "number" then
                return math.abs(lhsv - rhsv) < 0.0001
            end
        end
        
        return nil
    end
    return solver
end)()

local storage = (function()
    local storage = {}
    local dbPath = folder .. "/db1.json"
    local imgDbPath = folder .. "/imageanswers.json"
    local dbCache = {}
    local imgDbCache = {}

    local function downloadFile(url, path)
        writefile(path, game:HttpGet("https://ancestrychanged.fun/trueorfalse/" .. url))
        return content

    end

    function storage.init()
        if not isfile(dbPath) then downloadFile("db1.json", dbPath) end
        if isfile(dbPath) then
            dbCache = httpServ:JSONDecode(readfile(dbPath))
        end

        if not isfile(imgDbPath) then downloadFile("imageanswers.json", imgDbPath) end
        if isfile(imgDbPath) then
            imgDbCache = httpServ:JSONDecode(readfile(imgDbPath))
        end
    end

    local function saveDb() writefile(dbPath, httpServ:JSONEncode(dbCache)) end
    local function saveImgDb() writefile(imgDbPath, httpServ:JSONEncode(imgDbCache)) end

    function storage.getAns(q) return dbCache[q] end
    function storage.addAns(q, ans)
        if dbCache[q] == ans then return end
        dbCache[q] = ans
        saveDb()
    end

    function storage.delAns(q) dbCache[q] = nil; saveDb() end
    function storage.getAll() return dbCache end
    
    function storage.makeImgKey(q, ass) return q .. "|" .. tostring(ass) end
    function storage.getImgAns(q, ass)
        local key = storage.makeImgKey(q, ass)
        return imgDbCache[key]
    end

    function storage.addImgAns(q, ass, ans)
        local key = storage.makeImgKey(q, ass)
        if imgDbCache[key] == ans then return end
        imgDbCache[key] = ans
        saveImgDb()
    end

    return storage
end)()

local popSolver = (function()
    local solver = {}
    solver.enabled = false
    solver.con = nil
    local latencyMult = 0.6 
    local bufDeg = 0       
    local maxVel = 500       
    local db = 0.08
    local lastClick = 0
    local cCount = 0
    local lastTargetRot = nil
    local ffTarget = false
    local lastRot = 0
    local lastTime = 0
    
    local function angularDist(a, b)
        local diff = math.abs(a - b) % 360
        return diff > 180 and (360 - diff) or diff
    end

    function solver.getObjs()
        local s = workspace:FindFirstChild("PopTheLock") and workspace.PopTheLock:FindFirstChild("Screen")
        if not s then return nil, nil end
        local sg = s:FindFirstChild("SurfaceGui")
        if not sg then return nil, nil end
        local spinner = sg:FindFirstChild("GrayCircleOutline") or sg:FindFirstChild("GrayCircleOutline2")
        local t = sg:FindFirstChild("CoinPosition")
        return spinner, t
    end

    function solver.start()
        if solver.con then return end
        solver.enabled = true
        lastClick = 0; cCount = 0; lastTargetRot = nil; ffTarget = false; lastRot = 0; lastTime = tick()
        
        solver.con = runServ.RenderStepped:Connect(function()
            if not solver.enabled then return end
            local spinner, target = solver.getObjs()
            if not (spinner and target) then return end
            local now = tick(); local dt = now - lastTime
            local sRot = spinner.Rotation % 360; local tRot = target.Rotation % 360
            local deltaRot = sRot - lastRot
            if deltaRot < -180 then deltaRot = deltaRot + 360 end
            if deltaRot > 180 then deltaRot = deltaRot - 360 end
            local vel = math.min(math.abs(deltaRot / dt), maxVel)
            lastRot = sRot; lastTime = now
            if lastTargetRot == nil or angularDist(tRot, lastTargetRot) > 5 then
                lastTargetRot = tRot; ffTarget = false
            end
            if ffTarget then return end
            if now - lastClick < db then return end
            if vel < 10 then return end
            local dist = angularDist(sRot, tRot)
            local ping = game:GetService("Players").LocalPlayer:GetNetworkPing()
            local lat = ping / 2
            local trav = vel * lat * latencyMult
            local triggerDist = trav + bufDeg
            if dist <= triggerDist then
                lastClick = now; ffTarget = true; cCount = cCount + 1
                task.spawn(function()
                    if keypress then
                        keypress(string.byte("E"))
                        task.wait(0.03)
                        keyrelease(string.byte("E"))
                    end
                end)
            end
        end)
    end
    function solver.stop()
        solver.enabled = false
        if solver.con then solver.con:Disconnect(); solver.con = nil end
    end
    function solver.toggle(state) if state then solver.start() else solver.stop() end end
    return solver
end)()


local coolrequest = network.coolrequest
storage.init()

local ignoredPhrases = (function()
    local path = folder .. "/ignoredphrases.json"
    local cache = {}
    
    if not isfile(path) then
        local content = game:HttpGet("https://ancestrychanged.fun/trueorfalse/ignoredphrases.json")
        writefile(path, content)
    end
    
    if isfile(path) then
        cache = httpServ:JSONDecode(readfile(path))
    end
    
    return cache
end)()
