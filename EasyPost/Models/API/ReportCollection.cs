﻿using System.Collections.Generic;
using EasyPost.Models.Shared;
using Newtonsoft.Json;

namespace EasyPost.Models.API
{
    public class ReportCollection : Collection
    {
        #region JSON Properties

        [JsonProperty("reports")]
        public List<Report>? Reports { get; set; }
        [JsonProperty("type")]
        public string? Type { get; set; }

        #endregion

        internal ReportCollection()
        {
        }
    }
}
