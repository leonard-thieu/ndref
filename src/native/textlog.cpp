String globalAppFolder;

String GetAppFolder()
{
    return globalAppFolder;
}

std::vector<unsigned char> logBuffer;

void AppendToLog(const String &line, const String &path, bool flush)
{
    line.Save(logBuffer);

    if (flush)
    {
        String modes = String("ab");
        FILE *file = fopen(path.ToCString<char>(), modes.ToCString<char>());
        if (file)
        {
            line.Save(file);
        }
        else
        {
            printf("FOPENFOPEN 'ab' for AppendToLog '%s' failed\n", path.ToCString<char>());
            fflush(stdout);
        }
    }
}
