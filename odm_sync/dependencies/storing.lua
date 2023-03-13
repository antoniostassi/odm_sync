--
_G._PATH = io.popen("cd"):read("*l")
local function fileExists(path)
    local file = io.open(path, "r")

    if file then
        file:close()
    end

    return file ~= nil
end

local function readFile(path)
    local file = io.open(path, "r")

    if file == nil then
        return nil
    end

    local code = file:read("*a")

    file:close()

    return code
end

local function writeFile(path, str)
    local file = io.open(path, "w+")

    if file == nil then
        return nil
    end

    file:write(str)
    file:close()

    return true
end
--
-- Saving Data
function LoadData(resourceName, filePath)
    if type(resourceName) ~= "string" then
        return error("LoadData requires a string [resourceName] as the first argument.")
    end

    if type(filePath) ~= "string" then
        return error("LoadData requires a string [filePath] as the second argument.")
    end

    local content = LoadResourceFile(resourceName, filePath)

    if not content then
        return {}
    end

    return json.decode(content)
end

function SaveData(resourceName, filePath, data)
    if type(resourceName) ~= "string" then
        return error("SaveData requires a string [resourceName] as the first argument.")
    end

    if type(filePath) ~= "string" then
        return error("SaveData requires a string [filePath] as the second argument.")
    end

    if type(data) ~= "table" then
        return error("SaveResourceFile requires a table [data] as the third argument.")
    end

    local content = json.encode(data, { indent = true })

    SaveResourceFile(resourceName, filePath, content)
end

function LoadResourceFile(resourceName, filePath)
    if type(resourceName) ~= "string" then
        return error("LoadResourceFile requires a string [resourceName] as the first argument.")
    end

    if type(filePath) ~= "string" then
        return error("LoadResourceFile requires a string [filePath] as the second argument.")
    end

    local path = _PATH .. "/".. filePath

    if not fileExists(path) then
        return error("invalid data file: " .. path)
    end

    local content = readFile(path)

    if type(content) ~= "string" then
        return error("invalid data file content: " .. path)
    end

    return content
end

function SaveResourceFile(resourceName, filePath, content)
    if type(resourceName) ~= "string" then
        return error("SaveResourceFile requires a string [resourceName] as the first argument.")
    end

    if type(filePath) ~= "string" then
        return error("SaveResourceFile requires a string [filePath] as the second argument.")
    end

    if type(content) ~= "string" then
        return error("SaveResourceFile requires a string [content] as the third argument.")
    end

    local path = _PATH .. "/".. filePath

    local result = writeFile(path, content)

    if not result then
        return error("failed writing data to file: " .. path)
    end
end


